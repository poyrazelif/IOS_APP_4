//
//  TableViewSample3.swift
//  IOS_App_4
//
//  Created by Kurumsal on 3.08.2023.
//

import UIKit
import TinyConstraints

struct Member {
    
    var name:String
    var surname:String
    var cars:[String]
}
class CarCell:UITableViewCell
{
    var currentMember:Member?
    var currentCar:String?
    
    private lazy var dataText:CustomLabel =
    {
        let lbl = CustomLabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews()
    {
        self.contentView.addSubviews(dataText)
        setLayouts()
    }
    
    func setLayouts()
    {
        dataText.topToSuperview(offset: 8)
        dataText.leadingToSuperview(offset: 8)
        dataText.trailingToSuperview(offset:8)
        dataText.height(100)
    }
    
    func configureCell(currentMember: Member? = nil, currentCarIndex:Int? = 0)
    {
        guard let memberUnWrapped = currentMember , let currentCarIndexUnWrapped = currentCarIndex else {return}
        let currentCar = memberUnWrapped.cars[currentCarIndexUnWrapped]
        self.currentCar = currentCar
        self.currentMember = memberUnWrapped
        
        self.dataText.text =
        """
        Name   : \(memberUnWrapped.name)
        Surname: \(memberUnWrapped.surname)
        Car    : \(currentCar)
        """
    }
    
    
    
}
class TableViewSample3: UIViewController {
    
    var memberArray = [Member(name: "Tarık", surname: "Efe", cars: ["Mercedes","BMW","Mustang"]),
       Member(name: "Mahmut", surname: "Doğan", cars: ["Volkwagen","Audi","Camaro"]),
       Member(name: "Şevval", surname: "Çakıroğlu", cars: ["Audi","Volvo","Tofaş"]),
       Member(name: "Emirhan", surname: "İmrahor", cars: ["Ferrari SF90"])]
    var newMemberArr:[Member]!
    private lazy var tableViewCars:UITableView =
    {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        tb.rowHeight = UITableView.automaticDimension
        tb.estimatedRowHeight = 100
        tb.register(CarCell.self, forCellReuseIdentifier: "CarrCell")
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        newMemberArr = memberArray.sorted(by: {$0.name<$1.name})
        addSubviews()
    }
    
    func addSubviews()
    {
        self.view.addSubviews(tableViewCars)
        setLayouts()
    }
    
    func setLayouts()
    {
        tableViewCars.edgesToSuperview()
    }

}
extension TableViewSample3:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
extension TableViewSample3:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        newMemberArr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newMemberArr[section].cars.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarrCell", for: indexPath) as? CarCell else { return UITableViewCell()}
        cell.configureCell(currentMember: newMemberArr[indexPath.section], currentCarIndex: indexPath.row)
        
        return cell
    }
}
