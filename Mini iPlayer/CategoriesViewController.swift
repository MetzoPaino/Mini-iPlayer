//
//  ViewController.swift
//  Mini iPlayer
//
//  Created by William Robinson on 25/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import UIKit
import IBLRequest

class CategoriesViewController: UIViewController {

    @IBOutlet private var collectionView: UICollectionView!
    
    private let iblRequest = IBLRequest()
    private var categories = [IBLCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iblRequest.getCategories { (categories) in
            DispatchQueue.main.async {
                self.categories = categories
                self.collectionView.reloadData()
            }

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let viewController = segue.destination as? EpisodesViewController, let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
            
            viewController.category = categories[selectedIndexPath.row]
        }
    }
}

extension CategoriesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: categories[indexPath.row].title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
}

extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
