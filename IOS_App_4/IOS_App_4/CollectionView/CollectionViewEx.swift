//
//  CollectionViewEx.swift
//  IOS_App_4
//
//  Created by Kurumsal on 7.08.2023.
//

import UIKit
import TinyConstraints
import SnapKit

class CollectionViewEx: UIViewController {
    
    var chargingStations: [ChargingStation] = [
        ChargingStation(title: "FastCharge Station", status: status.available, Address: "Dubai", distance: "3.5 km", chargingCapacity: "5.9ku", chargePoints: 6),
        ChargingStation(title: "GreenPower Point", status: status.available, Address: "Vancouver", distance: "7.5 km", chargingCapacity: "35.2ku", chargePoints: 2),
        ChargingStation(title: "Energy Boost Hub", status: status.busy, Address: "Tokyo", distance: "2.5 km", chargingCapacity: "15.4ku", chargePoints: 12)]
        
    
    private lazy var CollectionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.delegate = self
        cv.dataSource = self
        cv.register(CollectionVCell.self, forCellWithReuseIdentifier: "collectionVCell")
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        
        self.view.backgroundColor = .white
        self.view.addSubview(CollectionV)
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        CollectionV.bottomToSuperview(offset : -100)
        CollectionV.edgesToSuperview(excluding: [.bottom,.top], insets: .left(16) + .right(16))
        CollectionV.height(200)
    }
}
extension CollectionViewEx : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

         let size = CGSize(width: (collectionView.frame.width - 32) , height: 200)
         return size
     }
}
extension CollectionViewEx : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chargingStations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionVCell", for: indexPath) as? CollectionVCell else { return UICollectionViewCell() }
                
                let object = chargingStations[indexPath.row]
                cell.configureCell(chargingStation: object)
                
                return cell
    }
    
        
}
