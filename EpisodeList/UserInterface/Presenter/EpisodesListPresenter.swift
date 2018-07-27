//
//  EpisodesListPresenter.swift
//  EpisodeList
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class EpisodesListPresenter {
    
    var collection: EpisodesPresentableCollection?
    var userInterface: EpisodesListViewInterface?
    var listInteractor: EpisodesListInteractorInput?
}

extension EpisodesListPresenter: EpisodesListInteractorOutput {
    
    func retrievedEpisodes(_ episodes: [EpisodeTitleProvider]) {
        collection = EpisodesPresentableCollection()
        if let episodeCollection = collection {
            episodeCollection.addEpisodeList(episodeList: episodes)
            userInterface?.showEpisodesDisplayData(episodeCollection.collectedData)
        }
    }
}

//class CategoriesListPresenter {
//
//    var listInteractor: CategoriesListInteractorInput?
//    var userInterface: CategoriesListViewInterface?
//    var listWireframe: CategoriesListWireframe?
//    var collection: CategoriesPresentableCollection?
//
//}
//
//extension CategoriesListPresenter: CategoriesListInteractorOutput {
//
//    func retrievedCategories(_ categories: [CategoryPresentable]) {
//        collection = CategoriesPresentableCollection()
//        if let catCollection = collection {
//            catCollection.addCategoryList(categories)
//            userInterface?.showCategoriesDisplayData(catCollection.collectedDisplayData)
//        }
//    }
//
//}
//
//extension CategoriesListPresenter: CategoriesListModuleInterface {
//
//    func updateView() {
//        listInteractor?.retrieveCategories()
//    }
//
//    func selected(indexPath: IndexPath) {
//        if let category = collection?.categoryId(for: indexPath),
//            let wireframe = listWireframe {
//            wireframe.selected(category: category)
//        }
//    }
//
//}
