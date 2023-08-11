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
    var reloadtableView: (()->())? // yeniden yükleme closure ı içerisi vc de doldurulacak şekilde tanımlandı
    private lazy var numberOfTows = 0
    //profiller array i
    private var profiles = [Profile]()
    
    // cell lere verilmek üzere oluşturulan model struct ından cell bilgisi struct array i oluşturuldu
    // did set ile model struct dizisinde değişiklik olursa reloadtableview closure ı tetiklenecek ve tanımlandığı yerde tanımlandığı şekilde çalışacak
    private var cellViewModels: [ProfileListCellViewModel] = [ProfileListCellViewModel]()
    {
       didSet {
                self.reloadtableView?()
              }
    }
    
    init(apiService: APIServiceProtocol = APIService()) {
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

