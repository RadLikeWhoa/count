//
//  MasterViewController.swift
//  Count!
//
//  Created by Sacha Schmid on 24.2.17.
//
//

import UIKit
import RealmSwift

class MasterViewController: UITableViewController {
    
    // MARK: - Properties 
    
    private let realm = try! Realm()
    
    private lazy var counters: Results<Counter> = { self.realm.objects(Counter.self) }()
    private var filteredCounters = [Counter]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var emptyStateGesture: UITapGestureRecognizer? = nil
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if counters.count > 0 {
            navigationItem.leftBarButtonItem = editButtonItem
        }
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        definesPresentationContext = true
        
        searchController.searchBar.tintColor = UIColor(hex: 0x283048)
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        toggleEmptyState()
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let counter = isSearching() ? filteredCounters[indexPath.row] : counters[indexPath.row]
            
            let controller = segue.destination as! DetailViewController
            controller.counter = counter
        } else if segue.identifier == "addItem" {
            let controller = (segue.destination as! UINavigationController).topViewController as! EditViewController
            controller.isNew = true
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindToMaster" {
            let source = segue.source as! EditViewController
            
            tableView.reloadData()
            
            if (source.isNew) {
                tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                toggleEditItem()
            }
        } else if segue.identifier == "deleteItem" {
            if let indexPath = tableView.indexPathForSelectedRow {
                try! realm.write() {
                    realm.delete(counters[indexPath.row])
                }
                
                tableView.reloadData()
                toggleEditItem()
            }
        }
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching() {
            return filteredCounters.count
        }
        
        return counters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CounterTableViewCell
        let counter: Counter
        
        if isSearching() {
            counter = filteredCounters[indexPath.row]
        } else {
            counter = counters[indexPath.row]
        }
        
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

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write() {
                realm.delete(counters[indexPath.row])
            }
            
            tableView.reloadData()
            setEditing(false, animated: false)
            toggleEditItem()
            toggleEmptyState()
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // let moving = counters[sourceIndexPath.row]
        
        // counters.remove(at: sourceIndexPath.row)
        // counters.insert(moving, at: destinationIndexPath.row)
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
    
    // MARK: - Search
    
    func filterContent(for searchText: String) {
        filteredCounters = counters.filter { counter in
            return counter.title.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    private func isSearching() -> Bool {
        return searchController.isActive && searchController.searchBar.text != ""
    }
    
    // MARK: - Events
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        setEditing(false, animated: true)
        performSegue(withIdentifier: "addItem", sender: nil)
    }
    
    // MARK: - Actions
    
    private func toggleEditItem() {
        if counters.count == 0 && navigationItem.leftBarButtonItem != nil {
            navigationItem.leftBarButtonItem = nil
            setEditing(false, animated: false)
        } else if navigationItem.leftBarButtonItem == nil {
            navigationItem.leftBarButtonItem = editButtonItem
        }
    }
    
    // MARK: - Empty State
    
    private func toggleEmptyState() {
        if counters.count == 0 {
            let emptyLabel = UILabel()
            emptyLabel.text = NSLocalizedString("Empty_Message", comment: "The prompt to create the first counter")
            emptyLabel.textAlignment = .center
            emptyLabel.numberOfLines = 0
            emptyLabel.textColor = UIColor(hex: 0xaaaaaa)
            emptyLabel.font = UIFont(name: ".SFUIText-Medium", size: 18)
            emptyLabel.sizeToFit()
            
            emptyStateGesture = UITapGestureRecognizer(target: self, action: #selector(addItem))
            
            tableView.backgroundView = emptyLabel
            tableView.addGestureRecognizer(emptyStateGesture!)
        } else {
            tableView.backgroundView = nil
            
            if let emptyStateGesture = emptyStateGesture {
                tableView.removeGestureRecognizer(emptyStateGesture)
            }
        }
    }
    
}

// MARK: - UISearchController

extension MasterViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(for: searchController.searchBar.text!)
    }
}
