//
//  LevelVC.swift
//  Angry Birds
//
//  Created by eldorbek nusratov on 3/21/20.
//  Copyright © 2020 eldorbek nusratov. All rights reserved.
//

import UIKit

class LevelVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var data : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [1,2,3,4,5,6,7,8,9,10,11,12]
        setupCollectionView()
    }
    
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "LevelCVC", bundle: nil), forCellWithReuseIdentifier: "LevelCVC")
    }

}


extension LevelVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCVC", for: indexPath) as? LevelCVC else {
            return UICollectionViewCell()
        }
        cell.updateView(level: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 100
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        UIStoryboard(name: "Main", bundle: nil)
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GameController") as? GameViewController else {return}
        vc.level = data[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  20
    }
}
