//
//  CollectionVC.swift
//  IOS_App_4
//
//  Created by Kurumsal on 7.08.2023.
//

import UIKit
import SnapKit
import TinyConstraints

class CollectionVC: UIViewController {

    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubviews(collectionView)
        
        setupLayout()
    }
    
    func setupLayout()
    {
        
    }

}
extension CollectionVC : UICollectionViewDelegateFlowLayout {
    

}

extension CollectionVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          return  UICollectionViewCell()
    }
    
    
}
