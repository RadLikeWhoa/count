//
//  AppDelegate.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let realm = try! Realm()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UserDefaults.standard.register(defaults: [
            "helpViewed": false
        ])
        
        if realm.objects(Gradient.self).count == 0 {
            try! realm.write() {
                let defaultGradients = [
                    Gradient(label: "Sha La La", from: Color(hex: 0xE29587), to: Color(hex: 0xD66D75)),
                    Gradient(label: "Cherry", from: Color(hex: 0xF45C43), to: Color(hex: 0xEB3349)),
                    Gradient(label: "Dirty Fog", from: Color(hex: 0x8CA6DB), to: Color(hex: 0xB993D6)),
                    Gradient(label: "Instagram", from: Color(hex: 0x517fa4), to: Color(hex: 0x243949)),
                    Gradient(label: "Piglet", from: Color(hex: 0xffdde1), to: Color(hex: 0xee9ca7)),
                    Gradient(label: "Master Card", from: Color(hex: 0xeea849), to: Color(hex: 0xf46b45)),
                    Gradient(label: "Lush", from: Color(hex: 0xa8e063), to: Color(hex: 0x56ab2f)),
                    Gradient(label: "Venice", from: Color(hex: 0xA7BFE8), to: Color(hex: 0x6190E8)),
                    Gradient(label: "Emerald Water", from: Color(hex: 0x56B4D3), to: Color(hex: 0x348F50)),
                    Gradient(label: "Mojito", from: Color(hex: 0x93F9B9), to: Color(hex: 0x1D976C))
                ]
                
                self.realm.add(defaultGradients)
            }
        }
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDefaults.standard.synchronize()
    }

}

