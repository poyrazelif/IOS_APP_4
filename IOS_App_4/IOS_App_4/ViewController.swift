//
//  ViewController.swift
//  IOS_App_4
//
//  Created by Kurumsal on 2.08.2023.
//

import UIKit
import TinyConstraints
protocol PSendData
{
    func SendDataToBack()
}
extension ViewController: PSendData
{
    func SendDataToBack() {
        
    }
}
class ViewController: UIViewController {

    var transmitter = OTPVC()
    private lazy var imgHeader: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "background.jpg")
        
        return iv
    }()
    
    private lazy var lblPhoneTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "Telephone Number"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txtPhone:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="+90 (XXX) XXX XX XX"
        //tf.fontSize = 12
        tf.text = "+90"
        tf.LeftViewImageSystemName = "lock.fill"
        tf.leftViewMode = .always
        tf.delegate = self
        
        return tf
    }()
    private lazy var svPhone:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        
        return sv
    }()
    
    private lazy var btnSendOTP: CustomButton =
    {
        let button = CustomButton()
        button.setTitle("Send Code", for: .normal)

        button.addTarget(self, action: #selector(ButtonNextTapped), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transmitter.delegate = self
        self.view.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        AddSubViews()
    }
    
    @objc func ButtonNextTapped()
    {
        if(txtPhone.text == nil){
            return
        }
            
        let vc = OTPVC()
        vc.phoneNo = txtPhone.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func PhoneFormatter(mask:String,no:String) ->String {
        let num = no.replacingOccurrences(of: "[^0-9]", with: "",options: .regularExpression)
        var result:String = ""
        var index = num.startIndex
        
        for character in mask where index < num.endIndex {
            if character == "X" {
                result.append(num[index])
                index = num.index(after: index)
            }
            else { result.append(character)}
        }
        return result
    }
    
    func AddSubViews()
    {
        self.view.addSubviews(imgHeader,svPhone,btnSendOTP)
        svPhone.addArrangedSubview(lblPhoneTitle)
        svPhone.addArrangedSubview(txtPhone)
        
        SetAllConstraints()
    }
    
    
    func SetAllConstraints()
    {
        imgHeader.topToSuperview()
        imgHeader.edgesToSuperview(excluding: [.top,.bottom], insets: .left(-1) + .right(1) )
        imgHeader.height(150)
        
        svPhone.topToBottom(of: imgHeader,offset: 100)
        svPhone.edgesToSuperview(excluding: [.top,.bottom],insets: .left(16) + .right(16))
        svPhone.height(90)
        
        lblPhoneTitle.edgesToSuperview(excluding: [.top,.bottom],insets: .left(0) + .right(0))
        txtPhone.edgesToSuperview(excluding: [.top,.bottom],insets: .left(0) + .right(0))
        
        btnSendOTP.topToBottom(of: svPhone,offset: 30)
        btnSendOTP.edgesToSuperview(excluding: [.top,.bottom],insets: .left(80) + .right(80))
        btnSendOTP.height(50)
        
    }
    
}
extension ViewController: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        let newSt = (text as NSString).replacingCharacters(in: range, with: string)
        let formattedString = PhoneFormatter(mask: "+XX (XXX) XXX XX XX", no: newSt)
        //textField.text = "+90 \(formattedString)"
        textField.text = formattedString
        return false
    }
}


