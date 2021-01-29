//
//  LevelData.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/22/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import Foundation


struct LevelData{
    
    var birds : [String]
    
    init?(level: Int) {
        guard let levelDictionary = Levels.levelsDictionary["Level_\(level)"] as? [String:Any] else {return nil}
        guard let birds = levelDictionary["Birds"] as? [String] else {return nil}
        self.birds = birds
    }
    
}
