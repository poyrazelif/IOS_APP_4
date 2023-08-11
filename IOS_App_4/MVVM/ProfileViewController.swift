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
        return viewModel.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileTableViewCell else {return UITableViewCell()}
        let cellModel = viewModel.getCellModel(indexpath: indexPath)
        cell.configure(cellModel: cellModel)
        return cell
    }
    
    
}
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

class ProfileViewController: UIViewController {
    
    private lazy var tableViewProfile: UITableView =
    {   let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.rowHeight = UITableView.automaticDimension
        tb.estimatedRowHeight = 100
        tb.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tb.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        return tb
    }()
    private lazy var activityIndicator: UIActivityIndicatorView =
    {   let av = UIActivityIndicatorView()
        av.center = self.view.center
        return av
    }()
    
    private lazy var viewModel: ProfileViewModel = {
           return ProfileViewModel()
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubviews()
        
        initVM()
        
    }
    func initVM()
    {
        viewModel.updateLoadingStatus = { [weak self] () in
                    DispatchQueue.main.async {
                        let isLoading = self?.viewModel.isloading ?? false
                        if isLoading {
                            self?.activityIndicator.startAnimating()
                            UIView.animate(withDuration: 0.2, animations: {
                                self?.tableViewProfile.alpha = 0.0
                            })
                        }else {
                            self?.activityIndicator.stopAnimating()
                            UIView.animate(withDuration: 0.2, animations: {
                                self?.tableViewProfile.alpha = 1.0
                            })
                        }
                    }
                }
        
        viewModel.reloadtableView = { [weak self] () in
                DispatchQueue.main.async {
                    self?.tableViewProfile.reloadData()
                }
            }
        viewModel.showAlert = { message in
            DispatchQueue.main.async
            {self.showAlert( message )}
        }
            
        viewModel.initFetch()

    }
    func addSubviews() {
        self.view.addSubview(tableViewProfile)
        self.view.addSubview(activityIndicator)
        setLayout()
    }
    
    func setLayout()
    {
        tableViewProfile.edgesToSuperview()
    }
    
    func showAlert( _ message: String ) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }


}
