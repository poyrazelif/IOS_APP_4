//
//  ProfileViewController.swift
//  IOS_App_4
//
//  Created by Kurumsal on 10.08.2023.
//

import UIKit
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileTableViewCell else {return UITableViewCell()}
        cell.configure(profile: Profiles[indexPath])
    }
    
    
}
extension ProfileViewController: UITableViewDelegate {
    
}

class ProfileViewController: UIViewController {
    
    private lazy var tableViewProfile: UITableView =
    {   let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.rowHeight = UITableView.automaticDimension
        tb.estimatedRowHeight = 100
        tb.register(PersonTVCell.self, forCellReuseIdentifier: "PersonCell")
        return tb
    }()
    
    private lazy var viewModel: ProfileViewModel = {
           return ProfileViewModel()
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        
    }
    func initVM()
    {
        viewModel.reloadtableView = { [weak self] () in
                DispatchQueue.main.async {
                    self?.tableViewProfile.reloadData()
                }
            }
            
        viewModel.initFetch()

    }
    func addSubviews() {
        self.view.addSubview(tableViewProfile)
        setLayout()
    }
    
    func setLayout()
    {
        tableViewProfile.edgesToSuperview()
    }


}
