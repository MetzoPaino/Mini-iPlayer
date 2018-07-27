//
//  EpisodesViewController.swift
//  Mini iPlayer
//
//  Created by William Robinson on 16/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import UIKit
import IBLRequest

class EpisodesViewController: UIViewController {

    var presenter: EpisodeListPresenter!
    private var episodes = [Episode]()
    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.categoryTitle()
        
        presenter.updateWithEpisodes() { (episodes) in
            DispatchQueue.main.async {
                self.episodes = episodes
                self.collectionView.reloadData()
            }
        }
    }
}

extension EpisodesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: episodes[indexPath.row].title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes.count
    }
}

extension EpisodesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
