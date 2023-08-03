//
//  LoginVC.swift
//  IOS_App_4
//
//  Created by Kurumsal on 2.08.2023.
//

import UIKit
import SnapKit
import TinyConstraints

extension UIView
{
    func addSubviews(_ views:UIView...)
    {
        views.forEach({
        self.addSubview($0)
        })
    }
}
extension LoginVC: UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 0 )
        {
           return self.CityData[row].name
        }
        return self.CityData[currentCityIndex].states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 0 )
        {
            txtCity.text = CityData[row].name
            currentCityIndex = row
        }
        else{
            txtState.text = CityData[currentCityIndex].states[row]
        }
        self.view.endEditing(true)
        
        
    }
}
extension LoginVC: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 0 )
        {
            return CityData.count
        }
        return CityData[currentCityIndex].states.count
            
    }
}

protocol SifreYenileme
{
    func SifreDegistir(YeniSifre:String?)
}

class LoginVC: UIViewController, UITextFieldDelegate {

    var CityData:[City] = [City(name: "Ankara", states: ["Keçiören","Kızılay","Çankaya"]),
                           City(name: "İstanbul", states: ["Kadıköy","Sarıyer","Bakırköy"]),
                           City(name: "Balıkesir", states: ["Susurluk","Edremit","Erdek"]),
                           City(name: "Kocaeli", states: ["Gebze","Derince","Gölcük"])]
    
    var ActiveUser = (userName: "ElifP", userPassword: "1234")
    var currentCityIndex = 0
    
    private lazy var imgHeader: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "UI_Orange.png")
        
        return iv
    }()
    
    private lazy var lblWelcome: CustomLabel = {
        let l = CustomLabel()
        l.font = UIFont(name: CustomFont.Exo2Bold.rawValue, size: 30)
        l.text = "Welcome Back"
       
        return l
    }()
    
    private lazy var lblSubtitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "Login to your account"
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 16)
        return l
    }()
    //-------------------------------------------------------
    private lazy var lblUserNameTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "User Name"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txtUserName:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="Adınızı girin"
        
        tf.LeftViewImageSystemName = "person.fill"

        tf.leftViewMode = .always
        
        tf.delegate = self
        return tf
    }()
    private lazy var svUsername:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        
        return sv
    }()
    //-------------------------------------------------------
    
    private lazy var lblPasswordTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "Password"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txtPassword:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="Şifre girin"
        //tf.fontSize = 12
        
        tf.LeftViewImageSystemName = "lock.fill"
        tf.leftViewMode = .always
        
        tf.delegate = self
        return tf
    }()
    private lazy var svPassword:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        
        return sv
    }()
    //-------------------------------------------------------
    private lazy var lblEmailTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "E-Mail"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txtEmail:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="E-Mail"
        
        tf.LeftViewImageSystemName = "lock.fill"
        tf.leftViewMode = .always
        
        tf.delegate = self
        return tf
    }()
    private lazy var svEmail:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        
        return sv
    }()
    //----------------------------------------------------
    private lazy var lblCityTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "City"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txtCity:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="Cities"
        
        tf.LeftViewImageSystemName = "lock.fill"
        tf.leftViewMode = .always
        tf.delegate = self
        tf.inputView = CityPicker
        return tf
    }()
    private lazy var svCity:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        
        return sv
    }()
    private lazy var CityPicker: UIPickerView = {
        var pv = UIPickerView()

        pv = UIPickerView()
        pv.dataSource = self
        pv.delegate = self
        pv.tag = 0
        
        return pv
    }()
    
    //----------------------------------------------------
    private lazy var lblCityStateTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "State"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txtState:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="State"
        
        tf.LeftViewImageSystemName = "lock.fill"
        tf.leftViewMode = .always
        tf.delegate = self
        tf.inputView = StatePicker
        return tf
    }()
    private lazy var svState:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        
        return sv
    }()
    private lazy var StatePicker: UIPickerView = {
        var pv = UIPickerView()

        pv = UIPickerView()
        pv.dataSource = self
        pv.delegate = self
        pv.tag = 1
        
        return pv
    }()
    
    //----------------------------------------------------
    private lazy var lblSignUpTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "Bir Hesabınız Yok mu?"
        l.textAlignment = .right
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    
    private lazy var buttonNext: CustomButton =
    {
        let button = CustomButton()
        button.setTitle("Giriş Yap", for: .normal)

        button.addTarget(self, action: #selector(ButtonNextTapped), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var buttonForgotPassword: CustomButton =
    {
        let button = CustomButton()
        
        let attrString = NSAttributedString(string: "Şifremi Unuttum" , attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ])
         button.setAttributedTitle(attrString, for: .normal)
         button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
         button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(ButtonForgotPasswordTapped), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var buttonSignUp: CustomButton =
    {
        let button = CustomButton()
        
       let attrString = NSAttributedString(string: "Hemen Kaydol" , attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ])
        button.setAttributedTitle(attrString, for: .normal)
        button.titleLabel?.font = UIFont(name: CustomFont.Exo2Bold.rawValue, size: 14)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(ButtonSignUpTapped), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var stackView:UIStackView =
    {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 0
        sv.axis = .horizontal
        
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        AddSubViews()
    }

    @objc func ButtonNextTapped()
    {
        if ActiveUser.userName == txtUserName.text && ActiveUser.userPassword == txtPassword.text
        {
//           let vc = WelcomeVC()
//            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func ButtonSignUpTapped()
    {
//        let vc = SignUpVC()
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func ButtonForgotPasswordTapped()
    {
//        let vc = SifremiUnuttumVC()
//        vc.delegate = self
//         navigationController?.pushViewController(vc, animated: true)
    }


    func AddSubViews()
    {
        self.view.addSubviews(lblWelcome,lblSubtitle,svUsername,svPassword,svEmail,svCity,svState,stackView,buttonNext,buttonForgotPassword)
        svUsername.addArrangedSubview(lblUserNameTitle)
        svUsername.addArrangedSubview(txtUserName)
        
        svPassword.addArrangedSubview(lblPasswordTitle)
        svPassword.addArrangedSubview(txtPassword)
        
        svEmail.addArrangedSubview(lblEmailTitle)
        svEmail.addArrangedSubview(txtEmail)
        
        svCity.addArrangedSubview(lblCityTitle)
        svCity.addArrangedSubview(txtCity)
        
        svState.addArrangedSubview(lblCityStateTitle)
        svState.addArrangedSubview(txtState)
        
        stackView.addArrangedSubview(lblSignUpTitle)
        stackView.addArrangedSubview(buttonSignUp)
        
        SetAllConstraints()
    }
    
    
    func SetAllConstraints()
    {
        
        lblWelcome.topToSuperview(offset: 120)
        lblWelcome.edgesToSuperview(excluding: [.top,.bottom], insets: .left(16) + .right(16) )
        
        lblSubtitle.snp.makeConstraints({ make in
            
                make.top.equalTo(lblWelcome.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
            })
        
        
        svUsername.topToBottom(of: lblSubtitle)
        svUsername.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svUsername.height(80)
        
        lblUserNameTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtUserName.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        svPassword.topToBottom(of: svUsername,offset: 15)
        svPassword.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svPassword.height(80)
        
        lblPasswordTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtPassword.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        svEmail.topToBottom(of: svPassword,offset: 15)
        svEmail.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svEmail.height(80)
        
        lblEmailTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtEmail.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        svCity.topToBottom(of: svEmail,offset: 15)
        svCity.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svCity.height(80)
        
        lblCityTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtCity.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        svState.topToBottom(of: svCity,offset: 15)
        svState.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svState.height(80)
        
        lblCityStateTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtState.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        
        buttonForgotPassword.snp.makeConstraints({make in
            make.top.equalTo(svState.snp.bottom).offset(5)
            make.leading.equalTo(svState.snp.leading).offset(5)
        })
        
        buttonNext.snp.makeConstraints({make in
            make.top.equalTo(buttonForgotPassword.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(50)
        })
    
        buttonSignUp.width(130)

        
        stackView.bottomToSuperview(offset: -40)
        stackView.centerXToSuperview()
        stackView.height(40)
        
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

}
extension LoginVC: SifreYenileme
{
    func SifreDegistir(YeniSifre: String?) {
        
        guard let sifreyeni = YeniSifre else {return}
        ActiveUser.userPassword = sifreyeni
    }
}
