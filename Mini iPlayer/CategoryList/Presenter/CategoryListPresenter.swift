
//
//  CategoryListPresenter.swift
//  Mini iPlayer
//
//  Created by William Robinson on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import UIKit
import IBLRequest

class CategoryListPresenter {
    
    private let router = CategoryListRouter()
    private var interactor = CategoryListInteractor()

    func showEpisodeList(for category: IBLCategory, from viewController: UIViewController) {
        router.showEpisodesList(for: category, viewController: viewController)
    }
    
    func updateWithCategories(completion: @escaping ([IBLCategory]) -> ()) {
        interactor.fetchCategories() { (categories) in
            completion(categories)
        }
    }
    
}
