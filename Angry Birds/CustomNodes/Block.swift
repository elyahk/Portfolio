//
//  Block.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/21/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import SpriteKit

enum BlockType : String{
    case wood, stone, glass
}

class Block: SKSpriteNode {
    
    var type : BlockType!
    var health : Int
    var damageThreShold : Int
    
    init(type: BlockType) {
        self.type = type
        
        switch type {
        case .stone:
            health = 500
        case .glass:
            health = 1000
        case .wood:
            health = 200
        }
        
        damageThreShold = health / 2
        let texture1 = SKTexture(imageNamed: type.rawValue)
        super.init(texture: texture1, color: UIColor.clear, size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPhysicsBody(){
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.block
        physicsBody?.contactTestBitMask = PhysicsCategory.all
        physicsBody?.collisionBitMask = PhysicsCategory.all
    }
    
    func impact(force: Int){
        health -= force
        if health < 1{
            print("Remove")
            removeFromParent()
        }else if health < damageThreShold {
            let brokenTexture = SKTexture(imageNamed: type.rawValue+"Broken")
            texture = brokenTexture
        }
    }
}
