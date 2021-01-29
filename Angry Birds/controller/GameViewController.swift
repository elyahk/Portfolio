//
//  GameViewController.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/18/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {
    
    var level : Int = 1
    var scene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentGameScene()
        
    }
    
    func presentGameScene(){
        print(level, "game contoller")
        if let view = self.view as! SKView? {
            let sceneName = "GameScene_\(level)"
            if let scene = SKScene(fileNamed: sceneName) as? GameScene{
                scene.level = self.level
                scene.scaleMode = .resizeFill
                scene.sceneManager = self
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
        }
    }
    
}

extension GameViewController: SceneManager{
    func finish() {
        let vc = PopupVC(nibName: "PopupVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.isFailed = false
        vc.sceneManage = self
        present(vc, animated: false, completion: nil)
    }
    
    func retry() {
        scene?.removeFromParent()
        self.presentGameScene()
    }
    
    func home() {
        dismiss(animated: false, completion: nil)
    }
    
    func next() {
        scene?.removeFromParent()
        level += 1
        self.presentGameScene()
    }
    
    func failed() {
        let vc = PopupVC(nibName: "PopupVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.isFailed = true
        vc.sceneManage = self
        present(vc, animated: false, completion: nil)
    }
}



protocol SceneManager {
    func failed()
    func finish()
    func retry()
    func home()
    func next()
}
