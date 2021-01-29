//
//  LevelCVC.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/21/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import UIKit

class LevelCVC: UICollectionViewCell {

    @IBOutlet weak var levelLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    func updateView(level: Int){
        levelLbl.text = "Level \(level)"
    }
}
