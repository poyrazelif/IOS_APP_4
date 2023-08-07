//
//  EditPage.swift
//  IOS_App_4
//
//  Created by Elif Poyraz on 7.08.2023.
//

import UIKit
import TinyConstraints
import SnapKit

extension EditPage: UIPickerViewDelegate
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
extension EditPage: UIPickerViewDataSource,UITextFieldDelegate
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


class EditPage: UIViewController {

    var addressInfo : AddressInfo?
    var addressDelegate : AddressCellDelegate?
    var indexPath: IndexPath?
    
    var CityData:[City] = [City(name: "Ankara", states: ["Keçiören","Kızılay","Çankaya"]),
                           City(name: "İstanbul", states: ["Kadıköy","Sarıyer","Bakırköy"]),
                           City(name: "Balıkesir", states: ["Susurluk","Edremit","Erdek"]),
                           City(name: "Kocaeli", states: ["Gebze","Derince","Gölcük"])
                           ,City(name: "İzmir", states: ["Bornova","Gaziemir","Selçuk"])]
    
    var ActiveUser = (userName: "ElifP", userPassword: "1234")
    var currentCityIndex = 0
    
    
    private lazy var lblWelcome: CustomLabel = {
        let l = CustomLabel()
        l.font = UIFont(name: CustomFont.Exo2Bold.rawValue, size: 30)
        l.text = "Edit Address"
       
        return l
    }()
    
    private lazy var lblSubtitle: CustomLabel = {
        let l = CustomLabel()
        l.text = ""
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 16)
        return l
    }()
    //-------------------------------------------------------
    private lazy var lblUserNameTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "Name"
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
    private lazy var lblAddress: CustomLabel = {
        let l = CustomLabel()
        l.text = "Address"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var txtAddress:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="Address"
        
        tf.LeftViewImageSystemName = "location.fill"
        tf.leftViewMode = .always
        
        tf.delegate = self
        return tf
    }()
    private lazy var svAddress:UIStackView =
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
    //----------------------------------------------------
    
    private lazy var lblSwitchTitle: CustomLabel = {
        let l = CustomLabel()
        l.text = "Varsayılan Adres"
        l.textAlignment = .left
        l.font = UIFont(name: CustomFont.Exo2Regular.rawValue, size: 12)
        
        return l
    }()
    private lazy var switchDefault: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    private lazy var svswitchDefault: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.alignment = .center
        sv.spacing = 2
        sv.axis = .vertical
        
        return sv
    }()
    
    //----------------------------------------------------
    
    private lazy var buttonSave: CustomButton =
    {
        let button = CustomButton()
        button.setTitle("Kaydet", for: .normal)

        button.addTarget(self, action: #selector(ButtonSaveTapped), for: .touchUpInside)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        AddSubViews()
    }

    @objc func ButtonSaveTapped()
    {
        guard let name = txtUserName.text, let _state = txtState.text, let city = txtCity.text , let indexP = indexPath else {return}
        var newAddressInfo = addressInfo!
        newAddressInfo.name = name
        newAddressInfo.state = _state
        newAddressInfo.city = city
        addressDelegate?.getCellNewData(addressInfo: newAddressInfo , at: indexP)
        self.dismiss(animated: true)
    }
    
    func getTexts(addressInfo: AddressInfo)
    {
        self.addressInfo = addressInfo
        txtUserName.text = addressInfo.name
        txtAddress.text = addressInfo.address
        txtCity.text = addressInfo.city
        txtState.text = addressInfo.state
    }


    func AddSubViews()
    {
        self.view.addSubviews(lblWelcome,lblSubtitle,svUsername,svAddress,svCity,svState,svswitchDefault,buttonSave)
        
        svUsername.addArrangedSubview(lblUserNameTitle)
        svUsername.addArrangedSubview(txtUserName)
        
        svAddress.addArrangedSubview(lblAddress)
        svAddress.addArrangedSubview(txtAddress)
        
        svCity.addArrangedSubview(lblCityTitle)
        svCity.addArrangedSubview(txtCity)
        
        svState.addArrangedSubview(lblCityStateTitle)
        svState.addArrangedSubview(txtState)
        
        svswitchDefault.addArrangedSubview(lblSwitchTitle)
        svswitchDefault.addArrangedSubview(switchDefault)
        
        
        SetAllConstraints()
    }
    
    
    func SetAllConstraints()
    {
        
        lblWelcome.topToSuperview(offset: 100)
        lblWelcome.edgesToSuperview(excluding: [.top,.bottom], insets: .left(16) + .right(16) )
        
        lblSubtitle.snp.makeConstraints({ make in
            
                make.top.equalTo(lblWelcome.snp.bottom).offset(50)
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
            })
        
        
        svUsername.topToBottom(of: lblSubtitle)
        svUsername.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svUsername.height(80)
        
        lblUserNameTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtUserName.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        svAddress.topToBottom(of: svUsername,offset: 15)
        svAddress.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svAddress.height(80)
        
        lblAddress.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtAddress.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        svCity.topToBottom(of: svAddress,offset: 15)
        svCity.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svCity.height(80)
        
        lblCityTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtCity.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        svState.topToBottom(of: svCity,offset: 15)
        svState.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        svState.height(80)
        
        lblCityStateTitle.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtState.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        
        buttonSave.snp.makeConstraints({make in
            make.top.equalTo(svState.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(50)
        })

       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }



}
