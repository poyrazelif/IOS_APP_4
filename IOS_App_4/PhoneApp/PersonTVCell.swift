//
//  PersonTVCell.swift
//  IOS_App_4
//
//  Created by Kurumsal on 8.08.2023.
//

import UIKit
import TinyConstraints

class PersonTVCell: UITableViewCell {

    private lazy var lblName:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.font = UIFont(name: "AvenirNextMedium", size: 18)
        lbl.textAlignment = .left
        lbl.layer.borderColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 0.6464891245)
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addSubviews() {
        self.contentView.addSubviews(lblName)
    }
    
    func setLayout()
    {
        lblName.topToSuperview(offset:20)
        lblName.edgesToSuperview(excluding:[.bottom,.top,.right],insets: .left(16))
    }
    
    func configureCell(person:Person)
    {
        lblName.text = "\(person.name) \(person.surname)"
    }
}
