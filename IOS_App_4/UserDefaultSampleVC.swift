//
//  DepolamaVC.swift
//  IOS_App_4
//
//  Created by Kurumsal on 10.08.2023.
//

// User Default -Key chain access token ve şifreler keychainde tutulur - Remote Config. genelde launchscreende kullanılır. lauchda yüklenme barı sırasında arkada bu çalışabilir.- Core Data - sq lite
import UIKit
import TinyConstraints

class UserDefaultSampleVC: UIViewController {
    
    let userDefault = UserDefaults.standard
    
    let accessToken = "private_access_token"
    
    
    private lazy var buttonSave: CustomButton =
    {
        let button = CustomButton()
        
        let attrString = NSAttributedString(string: "Save" , attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ])
         button.setAttributedTitle(attrString, for: .normal)
         button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
         button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(btnSave), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var buttonDelete: CustomButton =
    {
        let button = CustomButton()
        
        let attrString = NSAttributedString(string: "Delete" , attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ])
         button.setAttributedTitle(attrString, for: .normal)
         button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
         button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(btnDelete), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var buttonRead: CustomButton =
    {
        let button = CustomButton()
        
        let attrString = NSAttributedString(string: "Read" , attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ])
         button.setAttributedTitle(attrString, for: .normal)
         button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
         button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(btnRead), for: .touchUpInside)
        return button
        
    }()
    private lazy var buttonUpdate: CustomButton =
    {
        let button = CustomButton()
        
        let attrString = NSAttributedString(string: "Update" , attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ])
         button.setAttributedTitle(attrString, for: .normal)
         button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
         button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(btnUpdate), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var txtValue:CustomTextField =
    {
        let tf = CustomTextField()
        tf.placeholder="Yeni değer girin"
        
        tf.LeftViewImageSystemName = "lock.fill"
        tf.leftViewMode = .always
       // tf.delegate = self
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        AddSubViews()
        
    }
    func AddSubViews()
    {
        self.view.addSubviews(buttonRead,buttonSave,buttonDelete,buttonUpdate,txtValue)
        setLayout()
    }
    func setLayout()
    {
        buttonSave.topToSuperview(offset:100)
        buttonSave.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        buttonSave.height(80)
        
        buttonUpdate.topToBottom(of: buttonSave,offset: 20)
        buttonUpdate.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        buttonUpdate.height(80)
        
        buttonDelete.topToBottom(of: buttonUpdate,offset: 20)
        buttonDelete.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        buttonDelete.height(80)
        
        buttonRead.topToBottom(of: buttonDelete,offset: 20)
        buttonRead.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        buttonRead.height(80)
        
        txtValue.topToBottom(of: buttonRead,offset: 20)
        txtValue.edgesToSuperview(excluding: [.top,.bottom] , insets: .left(16) + .right(16))
        txtValue.height(80)
        
    }
    
    @objc func btnSave(){
        userDefault.set(accessToken, forKey: "access-token")
        userDefault.synchronize() // kaydedilmeme ihtimaline karşı keinleştirmek için senkronize et
    }
    @objc func btnRead(){
        
        if let value = userDefault.string(forKey: "access-token") {
            print(value)
        }
        else{print("yok")}
    }
    @objc func btnUpdate(){
        let newValue = txtValue.text
        userDefault.set(newValue, forKey: "access-token")
    }
    @objc func btnDelete(){
        userDefault.removeObject(forKey: "access-token")
    }
    


}
