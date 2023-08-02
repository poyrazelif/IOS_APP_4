//
//  CustomButton.swift
//  IOS_App_4
//
//  Created by Kurumsal on 2.08.2023.
//

import UIKit

class CustomButton: UIButton {

    var ButtonTitle:String = "Empty"
    {
        didSet{
            ButtonSetTitle(Title: ButtonTitle)
        }
    }
    var ButtonTitleColor:CGColor = #colorLiteral(red: 0.0006260660011, green: 0.8870697021, blue: 0.6787766218, alpha: 1)
    {
        didSet{
            ButtonSetTitle(Color: ButtonTitleColor)
        }
    }
    init()
    {
        super.init(frame: .zero)
        self.titleLabel?.font = UIFont(name: CustomFont.Exo2Bold.rawValue, size: 30)
        self.backgroundColor = #colorLiteral(red: 0.0006260660011, green: 0.8870697021, blue: 0.6787766218, alpha: 1)
        self.layer.cornerRadius = 25
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func ButtonSetTitle(Title:String = "Empty" , Color:CGColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1))
    {
        let attrString = NSAttributedString(string: "Empty" , attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : Color  ])
        
        self.setAttributedTitle(attrString, for: .normal)
    }
    
}
