//
//  UserStruct.swift
//  IOS_App_4
//
//  Created by Kurumsal on 4.08.2023.
//

import Foundation

struct AddressInfo
{
    var name:String
    var address:String
    var state:String
    var city:String
    var country:String
    var phone:String
    var isDefault:Bool = false
    
    init(name: String = "", address: String = "", state: String = "", city: String = "", country: String = "", phone: String = "", isDefault: Bool = false) {
        self.name = name
        self.address = address
        self.state = state
        self.city = city
        self.country = country
        self.phone = phone
        self.isDefault = isDefault
    }
}
//user name leading trailing 16 alt satırla 10
