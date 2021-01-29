//
//  Bird.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/19/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import SpriteKit

enum BirdType : String{
    case red, blue, yellow, gray
}

class Bird: SKSpriteNode {
    
    var type : BirdType
    var grabbed : Bool = false
    var flying = false {
        didSet{
            if flying {
                self.physicsBody?.isDynamic = true
                self.animateFlight(active: true)
            }else {
                self.animateFlight(active: false)
            }
        }
    }
    
    var flyingFrames : [SKTexture]
    init(type: BirdType) {
        self.type = type
        
        flyingFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: type.rawValue), with: type.rawValue)
        let texture = SKTexture(imageNamed: type.rawValue + "1")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateFlight(active: Bool){
        if active {
            run(SKAction.repeatForever(SKAction.animate(with: flyingFrames, timePerFrame: 0.1, resize: true, restore: true)))
        }
    }
}
