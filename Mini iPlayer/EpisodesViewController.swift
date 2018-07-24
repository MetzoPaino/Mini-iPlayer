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

    var category: IBLCategory!
    private let iblRequest = IBLRequest()
    private var episodes = [Episode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.title
        iblRequest.getEpisodes(for: category.id) { (episodes) in
            DispatchQueue.main.async {
                self.episodes = episodes
                print(self.episodes)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
