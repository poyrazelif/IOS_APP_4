//
//  CustomLabel.swift
//  IOS_App_4
//
//  Created by Kurumsal on 2.08.2023.
//

import UIKit

class CustomLabel: UILabel {

    init()
    {
        super.init(frame: .zero)
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.text = "Temp Text"
        self.textAlignment = .left
        self.font = UIFont(name: CustomFont.Avenirmedium.rawValue, size: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
