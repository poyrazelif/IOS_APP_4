//
//  APIService.swift
//  MVVMPlayground
//
//  Created by Neo on 01/10/2017.
//  Copyright © 2017 ST.Huang. All rights reserved.
//

import Foundation

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {
    func fetchProfiles( complete: @escaping ( _ success: Bool, _ profiles: [Profile], _ error: APIError? )->() )
    // escaping asenkron çalışan closuredan gelecek olan veri geldi
}

class APIService: APIServiceProtocol {
    // Simulate a long waiting for fetching 
    func fetchProfiles( complete: @escaping ( _ success: Bool, _ profiles: [Profile], _ error: APIError? )->() ) {
        DispatchQueue.global().async {
            sleep(3)
            let path = Bundle.main.path(forResource: "content", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let profiles = try! decoder.decode(Profiles.self, from: data)
            complete( true, profiles.profiles, .noNetwork )

        }
    }
    
    
    
}







