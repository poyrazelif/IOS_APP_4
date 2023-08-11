//
//  ProfileTableViewCell.swift
//  IOS_App_4
//
//  Created by Elif Poyraz on 10.08.2023.
//

import UIKit
import TinyConstraints

class ProfileTableViewCell: UITableViewCell {

    private lazy var lblProfile: CustomLabel = {
        let l = CustomLabel()
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        return l
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addSubviews()
        
    }
    
    func addSubviews() {
        self.addSubviews(lblProfile)
        setLayout()
    }
    
    func setLayout()
    {
        lblProfile.topToSuperview(offset:44)
        lblProfile.edgesToSuperview(excluding: [.top,.bottom], insets: .left(16) + .right(16))
    }
    
    func configure(profile:Profile)
    {
        lblProfile.text = """
                            \(profile.name) + \(profile.surname)
                            \(profile.age)
                            \(profile.gender)
                          """
    }
    

}
