//
//  TodayViewController.swift
//  Count! Widget
//
//  Created by Sacha Schmid on 20.4.17.
//
//

import UIKit
import NotificationCenter
import RealmSwift

class TodayViewController: UIViewController, NCWidgetProviding {
    
    private lazy var realm: Realm = { try! Realm() }()
    
    private var counter: Counter?
    
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var incrementer: CounterButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let directory = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.me.sacha.count")!
        let realmPath = directory.appendingPathComponent("default.realm")
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(fileURL: realmPath)
        
        counter = realm.objects(CounterList.self).first?.items.first
        updateView()
    }
    
    func updateView() {
        if let counter = counter {
            gradientView.gradient = counter.gradient
            gradientView.cornerRadius = 5
            
            nameLabel.text = counter.title
            valueLabel.text = "\(counter.getCount())"
            incrementer.layer.cornerRadius = 5
        }
    }
    
    // MARK: - Actions
    
    @IBAction func increment(_ sender: Any) {
        try! realm.write {
            if let counter = self.counter {
                counter.increment()
                valueLabel.text = "\(counter.getCount())"
            }
        }
    }
    
    @IBAction func openApp(_ sender: Any) {
        extensionContext?.open(URL(string: "count://")!, completionHandler: nil)
    }
    
    // MARK: - Widget
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {        
        completionHandler(NCUpdateResult.newData)
    }
    
}
