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
        lbl.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return lbl
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        setLayout()
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
