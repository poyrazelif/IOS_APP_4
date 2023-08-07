//
//  CollectionData.swift
//  IOS_App_4
//
//  Created by Kurumsal on 7.08.2023.
//

import Foundation
enum status:String {
    
    case available = "Available"
    case busy = "Busy"
}

struct ChargingStation
{
    var title: String
    
    var status: status
    
    var Address: String
    var distance: String
    
    var chargingCapacity: String
    var chargePoints: Int

    init(title: String, status: status, Address: String, distance: String, chargingCapacity: String, chargePoints: Int) {
        self.title = title
        self.status = status
        self.Address = Address
        self.distance = distance
        self.chargingCapacity = chargingCapacity
        self.chargePoints = chargePoints
    }
    
    
   
}
