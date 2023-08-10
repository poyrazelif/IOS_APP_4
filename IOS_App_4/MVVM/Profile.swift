//
//  Profile.swift
//  IOS_App_4
//
//  Created by Kurumsal on 10.08.2023.
//

import Foundation
struct Profiles: Codable {
    let profiles: [Profile]
}
struct Profile: Codable  {
    
    let id: Int
    let name: String
    let surname: String
    let age: Int
    let gender: String
}
