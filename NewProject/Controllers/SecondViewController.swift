//
//  SecondViewController.swift
//  NewProject
//
//  Created by Puja Kumari on 3/21/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit

class SecondViewController:BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var dressCollectionView: UICollectionView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dressCollectionView.delegate = self
        dressCollectionView.dataSource = self
        //self.addSlideMenuButton()

       
    }
    // collectionView delegate & datasource Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "dressCollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: kSecondToThirdSegue, sender: nil)
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

}
