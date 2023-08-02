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
        self.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.text = "Temp Text"
        self.textAlignment = .center
        self.font = UIFont(name: CustomFont.Exo2Bold.rawValue, size: 36)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
