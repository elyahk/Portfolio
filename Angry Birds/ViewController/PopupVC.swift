//
//  PopupVC.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/22/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import UIKit

class PopupVC: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    var isFailed : Bool = false
    var sceneManage : SceneManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isFailed{
            imageV.image = #imageLiteral(resourceName: "popupfailed")
        }else {
            imageV.image = #imageLiteral(resourceName: "popupcleared")
        }
    }


    @IBAction func nextPressed(_ sender: UIButton) {
        sceneManage?.next()
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func retryPressed(_ sender: UIButton) {
        sceneManage?.retry()
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func homePressed(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
        sceneManage?.home()
    }
    
}
