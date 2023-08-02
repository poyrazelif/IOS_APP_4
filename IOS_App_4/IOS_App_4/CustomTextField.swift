//
//  CustomTextField.swift
//  IOS_App_4
//
//  Created by Kurumsal on 2.08.2023.
//

import Foundation
import UIKit

enum CustomFont:String
{
    case Ariel = "Ariel Narrow"
    case TrebuchetMS = "Trebuchet MS"
    case Verdana = "Verdana"
    case VerdanaBold = "Verdana Bold"
    case DINAlternate = "DIN Alternate"
    case PoppinsBold = "Poppins-Bold"
    case PoppinsMedium = "Poppins-Medium"
    case PoppinsRegular = "Poppins-Regular"
    case PoppinsSemiBold = "Poppins-SemiBold"
    case MontserratBold = "Montserrat-Bold"
    case MontserratMedium = "Montserrat-Medium"
    case MontserratRegular = "Montserrat-Regular"
    case Exo2Bold = "Exo2-Bold"
    case Exo2Regular = "Exo2-Regular"
    
//    var font:UIFont
//    {
//        switch self
//        {
//        case .Ariel:
//            return UIFont(name: "Ariel Narrow", size: 12) ?? UIFont(name: "AvenirNext-Bold", size: 12)!
//        case .TrebuchetMS:
//            return UIFont(name: "Trebuchet MS", size: 12) ?? UIFont(name: "AvenirNext-Bold", size: 12)!
//        case .Verdana:
//            return UIFont(name: "Verdana", size: 12) ?? UIFont(name: "AvenirNext-Bold", size: 12)!
//        case .VerdanaBold:
//            return UIFont(name: "Verdana Bold", size: 12) ?? UIFont(name: "AvenirNext-Bold", size: 12)!
//        case .DINAlternate:
//            return UIFont(name: "DIN Alternate", size: 12) ?? UIFont(name: "AvenirNext-Bold", size: 12)!
//        case .DNIAlternateHeight:
//            return UIFont(name: "DIN Alternate", size: 15) ?? UIFont(name: "AvenirNext-Bold", size: 15)!
//        }
//    }
}

class CustomTextField: UITextField
{
    var insets:UIEdgeInsets
    
    //property observer: değişken değiştiğinde bir şeyi otomatik olarak tetikler
    
    //    var fontSize:CGFloat = 14
    //    {
    //        didSet{
    //            self.font = UIFont(name: "Verdana-Bold", size: 5)
    //        }
    //    }
    
    var LeftViewImageSystemName:String = "person.fill"
    {
        didSet{
            SetLeftView(SystemIconName: LeftViewImageSystemName,LeftView:true)
        }
    }
    var LeftViewImageName:String = "person.fill"
    {
        didSet{
            SetLeftView(IconName: LeftViewImageName, LeftView: true)
        }
    }
    var RightViewImageSystemName:String = "person.fill"
    {
        didSet{
            SetLeftView(SystemIconName: LeftViewImageSystemName,LeftView:false)
        }
    }
    var RightViewImageName:String = "person.fill"
    {
        didSet{
            SetLeftView(IconName: LeftViewImageName, LeftView: false)
        }
    }
    
    
    init(insets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 12))
    {
        self.insets = insets
        super.init(frame: .zero)
        self.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.font = UIFont(name: CustomFont.Exo2Regular.rawValue , size: 15)
    
        // self.layer.borderColor = #colorLiteral(red: 0.2145309389, green: 0.2311202291, blue: 0.254332531, alpha: 1)
        // leftview için evde custom a ekle
        self.backgroundColor = #colorLiteral(red: 0.1918905675, green: 0.1997265518, blue: 0.2163873911, alpha: 1)
        self.layer.borderWidth = 0.7
        self.layer.borderColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 0.6464891245)
        self.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetLeftView(IconName:String,LeftView:Bool)
    {
        let imageView = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: IconName)
        imageView.tintColor = #colorLiteral(red: 0.0006260660011, green: 0.8870697021, blue: 0.6787766218, alpha: 1)
        
        
        let View = UIView(frame: CGRect(x: 0, y: 2, width: 44, height: 44))
        View.addSubview(imageView)
        
        if LeftView == true {self.leftView = View}
        else {self.rightView = View}
    }
    
    func SetLeftView(SystemIconName:String,LeftView:Bool)
    {
        let imageView = UIImageView(frame: CGRect(x: 11, y: 11, width: 22, height: 22))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: SystemIconName)
        imageView.tintColor = #colorLiteral(red: 0.0006260660011, green: 0.8870697021, blue: 0.6787766218, alpha: 1)
        
        
        let View = UIView(frame: CGRect(x: 0, y: 2, width: 44, height: 44))
        View.addSubview(imageView)
        
        if LeftView == true {self.leftView = View}
        else {self.rightView = View}
    }
    
    //textrectangle : text in yazılacağı rectangle
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return ounds.inset(by:insets)
//    }
//
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: insets)
//    }
//
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: insets)
//    }
//
//    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.inset(by: insets)
//    }
    
}
