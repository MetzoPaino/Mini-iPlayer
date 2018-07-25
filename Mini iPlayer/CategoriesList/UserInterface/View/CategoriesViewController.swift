//
//  CategoriesViewController.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 25/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit

var CategoryCellIdentifier = "CategoryCell"

class CategoriesViewController: UITableViewController {
    
    var eventHandler: CategoriesListModuleInterface?
    var data: CategoriesDisplayData?
    var strongTableView: UITableView?
    
    //MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strongTableView = tableView
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView()
    }
    
    //MARK: - Private
    
    private func configureView() {
        navigationItem.title = "Categories"
    }
    
    private func reloadEntries() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CategoriesViewController: CategoriesListViewInterface {
    
    func showCategoriesDisplayData(_ data: CategoriesDisplayData) {
        view = strongTableView
        self.data = data
        reloadEntries()
    }
    
}

//MARK: - UITableViewDelegate

extension CategoriesViewController {
    
}

//MARK: - UITableViewDataSource

extension CategoriesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.categories.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryTitle = data?.categories[indexPath.row].title
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCellIdentifier, for: indexPath) as UITableViewCell
        cell.textLabel?.text = categoryTitle
        return cell
    }
    
    
}
