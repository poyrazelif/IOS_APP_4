//
//  ProfileViewModel.swift
//  IOS_App_4
//
//  Created by Kurumsal on 10.08.2023.
//

import Foundation

struct ProfileListCellViewModel {
    let nameText: String
    let surnameText: String
    let ageText: String
    let genderText: String
}

class ProfileViewModel {
    
    let apiService : APIServiceProtocol
    
    private var profiles = [Profile]()
    
    private var cellViewModels: [ProfileListCellViewModel] = [ProfileListCellViewModel]()
   {
       didSet {
                self.reloadtableView?()
              }
    }
    
    var reloadtableView: (()->())?
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func initFetch() {
        apiService.fetchProfiles(complete: { [weak self] success, profiles, error in
            self?.processFetchedProfiles(profiles: profiles)
        })
    }
    
    private func processFetchedProfiles( profiles: [Profile] ) {
        self.profiles = profiles
        var vmstructArr = [ProfileListCellViewModel]()
        for profile in profiles {
            vmstructArr.append( createCellViewModel(profile: profile) )
        }
        self.cellViewModels = vmstructArr
    }
    
    func createCellViewModel( profile: Profile ) -> ProfileListCellViewModel {
        
        return ProfileListCellViewModel(nameText: profile.name, surnameText: profile.surname, ageText: String(profile.age), genderText: profile.gender)
    }
    
}

