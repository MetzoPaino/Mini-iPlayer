//
//  EpisodesViewController.swift
//  EpisodeList
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit

var EpisodeCellIdentifier = "EpisodeCell"

class EpisodesViewController: UITableViewController {
    
    var eventHandler: EpisodesListModuleInterface?
    var data: EpisodesDisplayData?
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
        navigationItem.title = "Episodes"
    }
    
    private func reloadEntries() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension EpisodesViewController: EpisodesListViewInterface {
    
    func showEpisodesDisplayData(_ data: EpisodesDisplayData) {
        view = strongTableView
        self.data = data
        reloadEntries()
    }
    
}

//MARK: - UITableViewDelegate

extension EpisodesViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}

//MARK: - UITableViewDataSource

extension EpisodesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.episodes.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryTitle = data?.episodes[indexPath.row].title
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCellIdentifier, for: indexPath) as UITableViewCell
        cell.textLabel?.text = categoryTitle
        return cell
    }
    
}
