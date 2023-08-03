//
//  OTPVC.swift
//  IOS_App_4
//
//  Created by Elif Poyraz on 3.08.2023.
//

import UIKit
import TinyConstraints

class OTPVC: UIViewController {

    var delegate:PSendData?
    var phoneNo:String?
    
    private lazy var lblPhoneTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "Sent to : \(phoneNo ?? " ")"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txt1:CustomTextField =
    {
        let tf = CustomTextField()
        tf.delegate = self
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        return tf
    }()
    private lazy var txt2:CustomTextField =
    {
        let tf = CustomTextField()
        tf.delegate = self
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        
        return tf
    }()
    private lazy var txt3:CustomTextField =
    {
        let tf = CustomTextField()
        tf.delegate = self
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        
        return tf
    }()
    private lazy var txt4:CustomTextField =
    {
        let tf = CustomTextField()
        tf.delegate = self
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        
        return tf
    }()
    private lazy var svTexts:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 5
        sv.axis = .horizontal
        
        return sv
    }()
    private lazy var btnNext: CustomButton =
    {
        let button = CustomButton()
        button.setTitle("Next", for: .normal)

        button.addTarget(self, action: #selector(ButtonNextTapped), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        AddSubViews()
    }
    
    @objc func ButtonNextTapped()
    {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func AddSubViews()
    {
        self.view.addSubviews(lblPhoneTitle,svTexts,btnNext)
        svTexts.addArrangedSubview(txt1)
        svTexts.addArrangedSubview(txt2)
        svTexts.addArrangedSubview(txt3)
        svTexts.addArrangedSubview(txt4)
        
        SetAllConstraints()
    }
    
    func SetAllConstraints()
    {
        lblPhoneTitle.topToSuperview(offset:270)
        lblPhoneTitle.edgesToSuperview(excluding: [.top,.bottom], insets: .left(26) + .right(26) )
        lblPhoneTitle.height(50)
        
        svTexts.topToBottom(of: lblPhoneTitle,offset: 10)
        svTexts.height(90)
        svTexts.width(220)
        svTexts.centerYToSuperview()
        svTexts.centerXToSuperview()
        
        txt1.width(50);txt1.height(60)
        txt2.width(50);txt2.height(60)
        txt3.width(50);txt3.height(60)
        txt4.width(50);txt4.height(60)
  
        
        btnNext.topToBottom(of: svTexts,offset: 30)
        btnNext.edgesToSuperview(excluding: [.top,.bottom],insets: .left(80) + .right(80))
        btnNext.height(50)
        
    }


}
extension OTPVC:UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if(textField == txt1) && range.length == 0
        {
            txt1.text = string
            txt2.becomeFirstResponder()
            
        }
        else if textField == txt2 && range.length == 0
        {
            txt2.text = string
            txt3.becomeFirstResponder()
        }
        else if textField == txt3 && range.length == 0
        {
            txt3.text = string
            txt4.becomeFirstResponder()
        }
        else if textField == txt4 && range.length == 0
        {
            txt4.text = string
        }
        
        return false
    }
}
