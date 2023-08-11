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
    var reloadtableView: (()->())? //reload data closure ı içerisi vc de doldurulacak şekilde tanımlandı
    var updateLoadingStatus : (()->())?
    var showAlert : ((String)->())?
    
    private var Alert : String? {
        didSet {
            if let showAlert2 = showAlert {
                showAlert2(Alert!)
            }
        }
    }
    private lazy var numberOfTows = 0
    
    private var profiles = [Profile]() //profiller array i
    
    // cell lere verilmek üzere oluşturulan model struct ından cell bilgisi struct array i oluşturuldu
    // did set ile model struct dizisinde değişiklik olursa reloadtableview closure ı tetiklenecek ve tanımlandığı yerde tanımlandığı şekilde çalışacak
    private var cellViewModels: [ProfileListCellViewModel] = [ProfileListCellViewModel]()
    {
       didSet {
                self.reloadtableView?()
              }
    }
    var isloading = false {
        didSet{
            self.updateLoadingStatus?() // update loading closure ını tetikler. false ise vc de indicator ü durdurur true ise indicator ü çalıştırır.
        }
    }
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
     
    // view controllerda view did load da tetiklenir.
    func initFetch() {
        self.isloading = true // did set ile update loading status tetiklenir.
        apiService.fetchProfiles(complete: { [weak self] success, profiles, error in
            if let error2 = error
            {
                self?.Alert = error2.rawValue
            }
            else{
                self?.processFetchedProfiles(profiles: profiles)
            }
            self?.isloading = false // did set ile update loading status tetiklenir.
           
        })
    }

    //
    private func processFetchedProfiles( profiles: [Profile] ) {
        self.profiles = profiles
        var vmstructArr = [ProfileListCellViewModel]()
        for profile in profiles {
            vmstructArr.append( createCellViewModel(profile: profile) )
        }
        self.cellViewModels = vmstructArr
    }
    
    func getRowCount()->Int
    {
        return cellViewModels.count
    }
    
    func createCellViewModel( profile: Profile ) -> ProfileListCellViewModel {
        
        return ProfileListCellViewModel(nameText: profile.name, surnameText: profile.surname, ageText: String(profile.age), genderText: profile.gender)
    }
    
    func getCellModel(indexpath:IndexPath) -> ProfileListCellViewModel
    {
        print(cellViewModels.count)
        print(cellViewModels[indexpath.row].nameText)
        return cellViewModels[indexpath.row]
    }
    
}

