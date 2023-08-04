//
//  AddressCell.swift
//  IOS_App_4
//
//  Created by Kurumsal on 4.08.2023.
//

import UIKit
import TinyConstraints

class AddressCell: UITableViewCell {

    var address:String = ""
    var name:String = ""
    var state:String = ""
    var city:String = ""
    var country:String = ""
    var phone: String = ""
    var isDefault:Bool = false
    
//    override func prepareForReuse() {
//        
//    }
    private lazy var lblName:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.font = UIFont(name: "AvenirNextMedium", size: 18)
        return lbl
    }()
    
    private lazy var lblAddress:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.textColor =  #colorLiteral(red: 0.568627451, green: 0.631372549, blue: 0.7333333333, alpha: 1)
        lbl.numberOfLines = 0
        return lbl
    }()
    private lazy var lblDefault:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.text = "Varsayılan Teslimat Adresi"
        lbl.isHidden = true
        return lbl
    }()
    private lazy var imgDefault:UIImageView =
    {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "iconNav.jpg")
        iv.isHidden = true
        return iv
    }()
    private lazy var svDefault:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .horizontal
        
        return sv
    }()
    
    private lazy var btnEdit:UIButton = {
        
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        btn.setTitle("Düzenle", for: .normal)
        return btn
    }()
    private lazy var btnDelete:UIButton = {
        
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        btn.setTitle("Sil", for: .normal)
        btn.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.8784313725, blue: 0.9058823529, alpha: 1)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func prepareForReuse() {
        self.imgDefault.isHidden = true
        self.lblDefault.isHidden = true
    }
    func configureCell(AddressSt: AddressInfo)
    {
        lblName.text = AddressSt.name
        lblAddress.text = """
                \(AddressSt.address)
                \(AddressSt.state)
                \(AddressSt.country)
                \(AddressSt.phone)
                """
        
        lblDefault.isHidden = !AddressSt.isDefault
        imgDefault.isHidden = !AddressSt.isDefault
        
//        if isDefault
//        {
//            lblDefault.isHidden = false
//            imgDefault.isHidden = false
//        }
    }
    
    func addSubviews()
    {
        self.contentView.addSubviews(lblName,lblAddress,svDefault,btnEdit,btnDelete)
        svDefault.addArrangedSubview(imgDefault)
        svDefault.addArrangedSubview(lblDefault)
        
        setLayout()
    }
    
    @objc func deleteCell()
    {
        print("blablalbalblabsa")
    }
    
    func setLayout()
    {
        lblName.topToSuperview(offset:20)
        lblName.edgesToSuperview(excluding:[.bottom,.top],insets: .left(16) + .right(16))
        
        lblAddress.topToBottom(of: lblName,offset: 10)
        lblAddress.edgesToSuperview(excluding: [.bottom,.top],insets: .left(16) + .right(16))
        
        svDefault.topToBottom(of: lblAddress,offset: 10)
        svDefault.edgesToSuperview(excluding: [.bottom,.top],insets: .left(16) + .right(16))
        
        imgDefault.height(20)
        lblDefault.height(20)
        
        btnDelete.bottomToSuperview(offset: -16)
        btnDelete.trailingToSuperview(offset: 16)
        btnDelete.height(50)
        
        btnEdit.bottomToSuperview(offset: -16)
        btnEdit.trailingToLeading(of: btnDelete,offset: -16)
        btnEdit.height(50)
    }

}
