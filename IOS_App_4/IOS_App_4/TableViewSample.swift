//
//  TableViewSample.swift
//  IOS_App_4
//
//  Created by Kurumsal on 3.08.2023.
//

//import UIKit
//import SnapKit
//import TinyConstraints
//
//class CustomCella:UITableViewCell
//{
//     lazy var lblTitle:CustomLabel = {
//        let l = CustomLabel()
//        l.textColor = .blue
//        return l
//    }()
//     lazy var lblSubTitle:CustomLabel = {
//        let l = CustomLabel()
//        l.textColor = .blue
//        return l
//    }()
//     lazy var lblDescs:CustomLabel = {
//        let l = CustomLabel()
//        l.textColor = .blue
//        return l
//    }()
//     lazy var imgHeader:UIImageView = {
//        let iv = UIImageView()
//        return iv
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    public func configure(name:String , image:UIImage)
//    {
//        lblTitle.text = name
//        lblSubTitle.text = name
//        lblDescs.text = name
//        imgHeader.image = image
//
//
//    }
//
//    private func setupViews()
//    {
//        self.contentView.addSubviews(lblTitle,lblSubTitle,lblDescs,imgHeader)
//        setupLayout()
//    }
//    private func setupLayout()
//    {
//        imgHeader.leadingToSuperview(offset:8)
//        imgHeader.topToSuperview(offset:8)
//        imgHeader.bottomToSuperview(offset:-8)
//        imgHeader.width(80)
//
//        lblTitle.top(to:imgHeader)
//        lblTitle.leadingToTrailing(of: imgHeader,offset: 12)
//        lblTitle.trailingToSuperview(offset:16)
//
//        lblSubTitle.topToBottom(of: lblTitle,offset:  8)
//        lblSubTitle.leading(to: lblTitle)
//
//        lblDescs.topToBottom(of: lblSubTitle,offset:  8)
//        lblDescs.leading(to: lblSubTitle)
//    }
//
////    override class func awakeFromNib() { ARAŞTIR
////
////    }
//}
//
//class TableViewSamplea: UIViewController {
//
//    let imgArr = [#imageLiteral(resourceName: "abstract_img"), #imageLiteral(resourceName: "abstract_img"), #imageLiteral(resourceName: "abstract_img")]
//    let array = ["istanbul","Ankara","İzmir"]
//    private lazy var tableView:UITableView =
//    {
//        let tv = UITableView()
//        tv.delegate = self
//        tv.dataSource = self
//        tv.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
//        return tv
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = #colorLiteral(red: 0.07363332063, green: 0.1019082293, blue: 0.1103803441, alpha: 1)
//        add()
//    }
//    private func add()
//    {
//        self.view.addSubviews(tableView)
//        setupView()
//    }
//
//    private func setupView()
//    {
//        tableView.edgesToSuperview()
//    }
//}
//extension TableViewSamplea: UITableViewDelegate{
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}
//extension TableViewSamplea: UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UITableViewCell() }
//        cell.lblTitle.text = array[indexPath.row]
//        cell.lblSubTitle.text = array[indexPath.row]
//        cell.lblDescs.text = array[indexPath.row]
//        cell.imgHeader.image = imgArr[indexPath.row]
//        return UITableViewCell()
//    }
//}

