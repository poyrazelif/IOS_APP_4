//
//  PersonTabBarControllerViewController.swift
//  IOS_App_4
//
//  Created by Kurumsal on 9.08.2023.
//

import UIKit

class PersonTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UITabBar.appearance()
        
        let quickSearchVC = QuickSearchVC()
        let quickSearchNav = UINavigationController(rootViewController: quickSearchVC)
        let qsImg = UIImage(systemName: "star")
        let qsSelectedImg = UIImage(systemName: "star.fill")
        quickSearchVC.tabBarItem = UITabBarItem(title: "Quick Search", image: qsImg, selectedImage: qsSelectedImg)
        
        let latestCallsVC = LatestCallsVC()
        let latestCallsNav = UINavigationController(rootViewController: latestCallsVC)
        let lcImg = UIImage(systemName: "clock")
        let lcSelectedImg = UIImage(systemName: "clock.fill")
        latestCallsVC.tabBarItem = UITabBarItem(title: "Latest Calls", image: lcImg, selectedImage: lcSelectedImg)
        
        let personVC = PersonVC()
        let personNav = UINavigationController(rootViewController: personVC)
        let pImg = UIImage(systemName: "person")
        let pSelectedImg = UIImage(systemName: "person.fill")
        personVC.tabBarItem = UITabBarItem(title: "Persons", image: pImg, selectedImage: pSelectedImg)
        
        let keypadVC = KeypadVC()
        let keypadNav = UINavigationController(rootViewController: keypadVC)
        let kImg = UIImage(systemName: "circle.grid.3x3")
        let kSelectedImg = UIImage(systemName: "circle.grid.3x3.fill")
        keypadVC.tabBarItem = UITabBarItem(title: "Keypad", image: kImg, selectedImage: kSelectedImg)
        
        let voiceMessagesVC = VoiceMessagesVC()
        let voiceMessagesNav = UINavigationController(rootViewController: voiceMessagesVC)
        let vmImg = UIImage(systemName: "recordingtape")
        let vmSelectedImg = UIImage(systemName: "recordingtape.fill")
        voiceMessagesVC.tabBarItem = UITabBarItem(title: "Voice Messages", image: vmImg, selectedImage: vmSelectedImg)
        
        self.viewControllers = [quickSearchNav,latestCallsNav,personNav,keypadNav,voiceMessagesNav]
    }

//star.fill
    //clock.fill
    //person.fill
    //circle.grid.3x3.fill
    //recordingtape.fill
}
