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
        l.numberOfLines = 0
        return l
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
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
    
    func configure(cellModel: ProfileListCellViewModel)
    {
        lblProfile.text = """
                            \(cellModel.nameText)  \(cellModel.surnameText)
                            \(cellModel.ageText)
                            \(cellModel.genderText)
                          """
    }
    

}
