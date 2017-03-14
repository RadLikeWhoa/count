//
//  MasterViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit

class MasterViewController: UITableViewController {
    
    // MARK: - Properties 
    
    private var counters = [Counter]()
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = counters[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.counter = object
            }
        } else if segue.identifier == "addItem" {
            let controller = (segue.destination as! UINavigationController).topViewController as! EditViewController
            controller.isNew = true
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindToMaster" {
            let source = segue.source as! EditViewController
            
            if (source.isNew) {
                counters.insert(source.counter, at: 0)
                
                let indexPath = IndexPath(row: 0, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        } else if segue.identifier == "deleteItem" {
            if let indexPath = tableView.indexPathForSelectedRow {
                counters.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CounterTableViewCell
        let counter = counters[indexPath.row]
        
        cell.counter = counter
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - Table View Events

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counters.count
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            counters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moving = counters[sourceIndexPath.row]
        
        counters.remove(at: sourceIndexPath.row)
        counters.insert(moving, at: destinationIndexPath.row)
    }
    
    // MARK: - Table View Styling
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    // MARK: - Events
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        setEditing(false, animated: true)
        performSegue(withIdentifier: "addItem", sender: nil)
    }
    
}

