//
//  CollectionVCell.swift
//  IOS_App_4
//
//  Created by Kurumsal on 7.08.2023.
//

import UIKit
import TinyConstraints

class CollectionVCell: UICollectionViewCell {
    
    
    
    private lazy var lblTitle: CustomLabel = {
        let l = CustomLabel()
        l.font = UIFont(name: CustomFont.Exo2Bold.rawValue, size: 14)
        return l
    }()
    private lazy var lblStatus: CustomLabel = {
        let l = CustomLabel()
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 10)
        return l
    }()
    private lazy var lblAddress: CustomLabel = {
        let l = CustomLabel()
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 10)
        return l
    }()
    private lazy var lblDistance: CustomLabel = {
        let l = CustomLabel()
        l.text = "User Name"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 10)
        
        return l
    }()
    private lazy var imgDistance: UIImageView = {
        let l = UIImageView()
        l.image = UIImage(systemName: "key.fill")
        
        return l
    }()
    private lazy var svDistance: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        return sv
    }()
    private lazy var lblCharcingCap: CustomLabel = {
        let l = CustomLabel()
        l.text = "User Name"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 10)
        
        return l
    }()
    private lazy var lblChargePoints: CustomLabel = {
        let l = CustomLabel()
        l.text = "User Name"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 10)
        
        return l
    }()
    private lazy var viewLine: UIView = {
        let line = UIView()
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.1604188383, green: 0.1723683178, blue: 0.1849045753, alpha: 1)
        self.layer.borderColor =  #colorLiteral(red: 0.0006260660011, green: 0.8870697021, blue: 0.6787766218, alpha: 1)
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 40
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.2846965194, green: 0.2980228066, blue: 0.3228514791, alpha: 1)
        self.selectedBackgroundView = bgColorView
        
        addSubviews()
    }
    
    func configureCell(chargingStation:ChargingStation)
    {
        lblTitle.text = chargingStation.title
        lblStatus.text = chargingStation.status.rawValue
        lblAddress.text = chargingStation.Address
        lblDistance.text = chargingStation.distance
        lblCharcingCap.text = chargingStation.chargingCapacity
        lblChargePoints.text = "\(chargingStation.chargePoints) charge points"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews()
    {
        self.contentView.addSubviews(lblTitle,lblStatus,lblAddress,lblCharcingCap,lblChargePoints,svDistance,viewLine)
        svDistance.addArrangedSubview(imgDistance)
        svDistance.addArrangedSubview(lblDistance)
        setLayout()
    }
    func setLayout()
    {
        
        lblTitle.topToSuperview(offset:20)
        lblTitle.edgesToSuperview(excluding: [.bottom,.top,.right], insets: .left(20))
        
        lblAddress.topToBottom(of: lblTitle, offset: 10)
        lblAddress.leading(to: lblTitle)
        
        viewLine.leading(to: lblAddress)
        viewLine.trailingToSuperview(offset: 20)
        viewLine.topToBottom(of: lblAddress,offset: 10)
        
        lblChargePoints.trailingToSuperview(offset:20)
        lblCharcingCap.leadingToSuperview(offset:20)
        
        svDistance.topToBottom(of: lblTitle,offset: 10)
        svDistance.trailing(to: lblChargePoints)
        
        
        
    }
}
