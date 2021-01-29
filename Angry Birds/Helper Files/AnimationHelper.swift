//
//  AnimationHelper.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/21/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import SpriteKit


class AnimationHelper{
    
    static func loadTextures(from atlas : SKTextureAtlas, with name: String) -> [SKTexture] {
        var textures = [SKTexture]()
        
        for index in 0..<atlas.textureNames.count {
            let texture = SKTexture(imageNamed: name + "\(index + 1)")
            textures.append(texture)
        }
        return textures
    }
}
