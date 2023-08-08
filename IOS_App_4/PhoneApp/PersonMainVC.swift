//
//  PersonMainVC.swift
//  IOS_App_4
//
//  Created by Kurumsal on 8.08.2023.
//

import UIKit
import TinyConstraints

class PersonMainVC: UIViewController {

    var PersonList: [Person] = [Person(name: "John", surname:  "Doe", phone: "+123456789", isWhatapps: true, isTelegram: false, image: UIImage(named: "person1")),
                               Person(name: "Jane", surname:  "Smith",phone: "+987654321", isWhatapps: true, isTelegram: true, image: UIImage(named: "person2")),
                               Person(name: "Michael", surname:  "Johnson",phone: "+555111222", isWhatapps: true, isTelegram: true, image: UIImage(named: "person3")),
                               Person(name: "Emily", surname:  "Davis",phone: "+999888777", isWhatapps: false, isTelegram: true, image: UIImage(named: "person4")),
                               Person(name: "Elizabeth", surname:  "Brown",phone: "+444333222", isWhatapps: true, isTelegram: false, image: UIImage(named: "person5")),
                               Person(name: "Olivia ",surname:  "Wilson", phone: "+777666555", isWhatapps: true, isTelegram: true, image: UIImage(named: "person6")),
                               Person(name: "James", surname:  "Taylor",phone: "+222333444", isWhatapps: false, isTelegram: true, image: UIImage(named: "person7")),
                               Person(name: "Ava", surname:  "Anderson",phone: "+888999000", isWhatapps: true, isTelegram: false, image: UIImage(named: "person8")),
                               Person(name: "Robert", surname:  " Martinez",phone: "+333444555", isWhatapps: true, isTelegram: true, image: UIImage(named: "person9")),
                               Person(name: "Sophia",surname:  "Johnson", phone: "+666777888", isWhatapps: false, isTelegram: true, image: UIImage(named: "person10")),
                               Person(name: "Liam",surname:  "Thomas", phone: "+111222333", isWhatapps: true, isTelegram: false, image: UIImage(named: "person11")),
                               Person(name: "Isabella",surname:  "Harris", phone: "+444555666", isWhatapps: true, isTelegram: true, image: UIImage(named: "person12")),
                               Person(name: "Ethan", surname:  "Wilson",phone: "+777888999", isWhatapps: true, isTelegram: false, image: UIImage(named: "person13")),
                               Person(name: "Mia", surname:  "Brown",phone: "+222333444", isWhatapps: false, isTelegram: true, image: UIImage(named: "person14")),
                               Person(name: "Noah", surname:  "Davis",phone: "+555666777", isWhatapps: true, isTelegram: true, image: UIImage(named: "person15")),
                               Person(name: "Emma",surname:  "Miller", phone: "+888999000", isWhatapps: true, isTelegram: false, image: UIImage(named: "person16")),
                               Person(name: "Aiden", surname:  "Wilson",phone: "+333444555", isWhatapps: false, isTelegram: true, image: UIImage(named: "person17")),
                               Person(name: "Olivia", surname:  "Johnson",phone: "+666777888", isWhatapps: true, isTelegram: true, image: UIImage(named: "person18")),
                               Person(name: "Elijah", surname:  "Smith",phone: "+111222333", isWhatapps: false, isTelegram: true, image: UIImage(named: "person19")),
                               Person(name: "Ava", surname:  "Taylor",phone: "+444555666", isWhatapps: true, isTelegram: false, image: UIImage(named: "person20"))]
    
    var Letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","R","S","T","U","V","Y","Z"]
    
    var personLetterArr:[[Person]] = []
    
    private lazy var tvPersons:UITableView = {
        let tv = UITableView()
        tv.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
        tv.delegate = self
      //  tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 100
        tv.register(PersonTVCell.self, forCellReuseIdentifier: "PersonCell")
        return tv
    }()
    
    func addSubviews() {
        self.view.addSubview(tvPersons)
        setLayout()
    }
    func setLayout(){
        tvPersons.edgesToSuperview(insets: .left(20) + .right(20) )
    }
    override func viewDidLoad() {
        SortPersons()
    }
    
    func SortPersons()
    {
        var tempArr:[Person] = []
        Letters.forEach({ letter in
            tempArr = PersonList.filter({ Person in
                Person.name.prefix(0) == letter
            }).sorted(by: { $0.name < $1.name } )
            personLetterArr.append(tempArr)
        })
        
        
        
        print(personLetterArr)
    }
        
}
extension PersonMainVC: UITableViewDelegate
{
    
}
//extension PersonMainVC: UITableViewDataSource
//{
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//
//}
