//
//  AddressVC.swift
//  IOS_App_4
//
//  Created by Kurumsal on 4.08.2023.
//

import UIKit
import TinyConstraints
// automatic refferance counter memory management araştır. deinit edilmek araştır.
protocol AddressCellDelegate:AnyObject
{
    func deleteCellRow(at indexPath: IndexPath)
}
class AddressVC: UIViewController {

    weak var delegate : AddressCellDelegate?
    
    var addressArray: [AddressInfo] = [
        AddressInfo(name: "John Doe", address: "123 Main St", state: "İstanbul", city: "Kadıköy", country: "Türkiye", phone: "555-1234", isDefault: true),
        AddressInfo(name: "Jane Smith", address: "456 Elm St", state: "Ankara", city: "Çankaya", country: "Türkiye", phone: "555-5678", isDefault: false),
        AddressInfo(name: "Alice Johnson", address: "789 Oak St", state: "İzmir", city: "Bornova", country: "Türkiye", phone: "555-9876", isDefault: false),
        AddressInfo(name: "Bob Williams", address: "321 Pine St", state: "Bursa", city: "Osmangazi", country: "Türkiye", phone: "555-4321", isDefault: false),
        AddressInfo(name: "Eve Brown", address: "654 Maple St", state: "Antalya", city: "Muratpaşa", country: "Türkiye", phone: "555-6789", isDefault: false),
        AddressInfo(name: "Michael Lee", address: "987 Birch St", state: "Adana", city: "Seyhan", country: "Türkiye", phone: "555-7890", isDefault: false),
        AddressInfo(name: "Sophia Davis", address: "246 Cedar St", state: "Eskişehir", city: "Tepebaşı", country: "Türkiye", phone: "555-2345", isDefault: false),
        AddressInfo(name: "William Martinez", address: "135 Walnut St", state: "Konya", city: "Selçuklu", country: "Türkiye", phone: "555-8765", isDefault: false),
        AddressInfo(name: "Olivia Johnson", address: "864 Pine St", state: "Mersin", city: "Yenişehir", country: "Türkiye", phone: "555-7654", isDefault: false),
        AddressInfo(name: "James Wilson", address: "579 Elm St", state: "Trabzon", city: "Ortahisar", country: "Türkiye", phone: "555-5432", isDefault: false)
    ]
    
    private lazy var tvAddresses:UITableView = {
        let tv = UITableView()
        tv.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 100
        tv.register(AddressCell.self, forCellReuseIdentifier: "AddressCell") /// ?????
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubviews()
        // Do any additional setup after loading the view.
    }
    
    func addSubviews()
    {
        self.view.addSubview(tvAddresses)
        setLayout()
    }
    func setLayout()
    {
        //tvAddresses.edgesToSuperview()
        tvAddresses.edgesToSuperview(insets: .left(20) + .right(20) )
      //  tvAddresses.leadingToSuperview(offset:16)
       // tvAddresses.trailingToSuperview(offset:16)
    }
    
    private func showAlert(message:String, for row:Int){
        
        let alert = UIAlertController(title: "Uyarı", message: "\(message) satırını silmek istediğinizden emin misiniz?", preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Evet", style: .default, handler: { action in
            self.deleteArrayElement(at: row)
        })
        
        let cancelButton = UIAlertAction(title: "Vazgeç", style: .destructive)
        
        alert.addAction(cancelButton)
        alert.addAction(doneAction)
        
        self.present(alert, animated: true)
        
    }
    
    private func deleteArrayElement(at row:Int){
        addressArray.remove(at: row)
        DispatchQueue.main.async {
            self.tvAddresses.reloadData()
        }
    }

}
extension AddressVC: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 190
    }
}
extension AddressVC: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addressArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell") as? AddressCell else {return UITableViewCell()}
        cell.configureCell(AddressSt: addressArray[indexPath.row])
        return cell
    }
}
extension AddressVC: AddressCellDelegate
{
    func deleteCellRow(at indexPath: IndexPath) {
        
        addressArray.remove(at: indexPath.row )
    }
}
