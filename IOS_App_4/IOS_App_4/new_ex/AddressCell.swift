//
//  AddressCell.swift
//  IOS_App_4
//
//  Created by Kurumsal on 4.08.2023.
//

import UIKit
import TinyConstraints

class AddressCell: UITableViewCell {

    weak var delegate : AddressCellDelegate?
    
   
    var address:String = ""
    var name:String = ""
    var state:String = ""
    var city:String = ""
    var country:String = ""
    var phone: String = ""
    var isDefault:Bool = false
    var cellIndex: IndexPath?
    
//    override func prepareForReuse() {
//        
//    }
    private lazy var lblName:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.font = UIFont(name: "AvenirNextMedium", size: 18)
        lbl.textAlignment = .left
        lbl.layer.borderColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 0.6464891245)
        return lbl
    }()
    
    private lazy var lblAddress:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.textColor =  #colorLiteral(red: 0.568627451, green: 0.631372549, blue: 0.7333333333, alpha: 1)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.layer.borderColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 0.6464891245)
        return lbl
    }()
    private lazy var lblDefault:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.text = "Varsayılan Teslimat Adresi"
        lbl.isHidden = true
        lbl.textAlignment = .left
        lbl.layer.borderColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 0.6464891245)
        return lbl
    }()
    private lazy var viewLine:UIView = {
        let line = UIView(frame: CGRect(x: 1, y: 1, width: 1, height: 10))
        line.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return line
    }()
    private lazy var imgDefault:UIImageView =
    {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "icon8.jpg")
        iv.isHidden = true
        return iv
    }()
    private lazy var svDefault:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = -25
        sv.axis = .horizontal
        
        return sv
    }()
    
    private lazy var btnEdit:UIButton = {
        
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        btn.setTitle("Düzenle", for: .normal)
        btn.addTarget(self, action: #selector(editCell), for: .touchUpInside)
        return btn
    }()
    private lazy var btnDelete:UIButton = {
        
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 14)
        btn.setTitle("Sil", for: .normal)
        btn.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        return btn
    }()
    private lazy var svButtons:UIStackView = {
        
            let sv = UIStackView()
            sv.distribution = .fillProportionally
            sv.alignment = .center
            sv.spacing = 4
            sv.axis = .horizontal
            
            return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.2846965194, green: 0.2980228066, blue: 0.3228514791, alpha: 1)
        self.selectedBackgroundView = bgColorView
        
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
                \(AddressSt.state) / \(AddressSt.city)
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
        self.contentView.addSubviews(lblName,lblAddress,svDefault,svButtons)
        svDefault.addArrangedSubview(imgDefault)
        svDefault.addArrangedSubview(lblDefault)
        
        svButtons.addArrangedSubview(btnEdit)
        svButtons.addArrangedSubview(viewLine)
        svButtons.addArrangedSubview(btnDelete)
    
        
        setLayout()
    }
    
    @objc func deleteCell()
    {
        print("blablalbalblabsa")
        delegate?.deleteCellRow(at: cellIndex!)
        
    }
    
    @objc func editCell()
    {
        delegate?.goToEdit(at: cellIndex!)
        
    }
    
    func setLayout()
    {
        lblName.topToSuperview(offset:20)
        lblName.edgesToSuperview(excluding:[.bottom,.top],insets: .left(16) + .right(16))
        
        lblAddress.topToBottom(of: lblName,offset: 10)
        lblAddress.edgesToSuperview(excluding: [.bottom,.top],insets: .left(16) + .right(16))
        
        svDefault.topToBottom(of: lblAddress,offset: 10)
        svDefault.edgesToSuperview(excluding: [.bottom,.top],insets: .left(-15) + .right(16))
        
        imgDefault.height(20)
        lblDefault.height(20)
        
        svButtons.bottomToSuperview(offset: -16)
        svButtons.trailingToSuperview(offset: 16)
        
        btnDelete.height(50)
        viewLine.height(25)
        viewLine.width(0.7)
        btnEdit.height(50)
    }

}
