//
//  SKNode+Extension.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/21/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import SpriteKit


extension SKNode{
    
    func aspectScale(to size: CGSize, width : Bool, multiplayer: CGFloat){
        let scale = width ? size.width / self.frame.size.width : size.height / self.frame.size.height
        setScale(scale)
    }
}
