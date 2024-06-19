//
//  ThreeView.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit

class ThreeView: UIView {
    
    var block1: ((String, String) -> Void)?
    
    var array: [Any]?
    
    var block: (() -> Void)?
    
    var naozhongblock: (() -> Void)?
    
    var gerenblock: (() -> Void)?
    
    var leftblock: (() -> Void)?
    
    var rightblock: (() -> Void)?

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "Slicebgiijfr")
        return bgImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 24.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.text = ""
        return nameLabel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "Slicemaoef")
        return iconImageView
    }()
    
    lazy var naozhongBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Sliceren"), for: .normal)
        btn.addTarget(self, action: #selector(naozhongClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var peopleBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicerilifadf"), for: .normal)
        btn.addTarget(self, action: #selector(gerenClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var maoImageView: UIImageView = {
        let maoImageView = UIImageView()
        maoImageView.contentMode = .scaleAspectFit
        maoImageView.image = UIImage(named: "Slicemao")
        return maoImageView
    }()
    
    lazy var whiimageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "Slicrty5hbvc")
        return iconImageView
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 24.pix())!, textColor: UIColor("#313131"), textAlignment: .center)
        timeLabel.text = getCurrentDateString()
        return timeLabel
    }()
    
    lazy var addBtn: UIButton = {
        let addBtn = UIButton(type: .custom)
        addBtn.setImage(UIImage(named: "Sliceadd"), for: .normal)
        addBtn.addTarget(self, action: #selector(addClick), for: .touchUpInside)
        return addBtn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PetCheckViewCell.self, forCellReuseIdentifier: "PetCheckViewCell")
        tableView.register(PetTwoCheckCell.self, forCellReuseIdentifier: "PetTwoCheckCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor("#FFFDF2")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var leftBtn: UIButton = {
        let leftBtn = UIButton(type: .custom)
        leftBtn.setImage(UIImage(named: "Sliceleftbtn"), for: .normal)
        leftBtn.addTarget(self, action: #selector(btnleftClick), for: .touchUpInside)
        return leftBtn
    }()
    
    lazy var rightBtn: UIButton = {
        let rightBtn = UIButton(type: .custom)
        rightBtn.setImage(UIImage(named: "Slicerightbtn"), for: .normal)
        rightBtn.addTarget(self, action: #selector(btnrightClick), for: .touchUpInside)
        return rightBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        bgImageView.addSubview(nameLabel)
        bgImageView.addSubview(iconImageView)
        bgImageView.addSubview(naozhongBtn)
        bgImageView.addSubview(peopleBtn)
        bgImageView.addSubview(maoImageView)
        bgImageView.addSubview(whiimageView)
//        bgImageView.addSubview(leftBtn)
//        bgImageView.addSubview(rightBtn)
        whiimageView.addSubview(timeLabel)
        addSubview(tableView)
        addSubview(addBtn)
        bgImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(340.pix())
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55.pix())
            make.left.equalToSuperview().offset(20.pix())
            make.height.equalTo(28.pix())
        }
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.right).offset(5.pix())
            make.top.equalTo(nameLabel.snp.top)
            make.size.equalTo(CGSize(width: 25.pix(), height: 23.pix()))
        }
        naozhongBtn.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.top).offset(-8.5)
            make.right.equalToSuperview().offset(-20.pix())
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
        }
        peopleBtn.snp.makeConstraints { make in
            make.right.equalTo(naozhongBtn.snp.left).offset(-10.pix())
            make.top.equalTo(naozhongBtn.snp.top)
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
        }
        maoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 275.pix(), height: 231.pix()))
            make.bottom.equalToSuperview().offset(-20.pix())
        }
//        leftBtn.snp.makeConstraints { make in
//            make.left.equalToSuperview().offset(20.pix())
//            make.size.equalTo(CGSize(width: 11.pix(), height: 26.pix()))
//            make.centerY.equalToSuperview()
//        }
//        rightBtn.snp.makeConstraints { make in
//            make.right.equalToSuperview().offset(-20.pix())
//            make.size.equalTo(CGSize(width: 11.pix(), height: 26.pix()))
//            make.centerY.equalToSuperview()
//        }
        whiimageView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(80.pix())
        }
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(25.pix())
            make.bottom.equalToSuperview().offset(-25.pix())
        }
        tableView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(whiimageView.snp.bottom)
        }
        addBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20.pix())
            make.bottom.equalToSuperview().offset(-60.pix())
            make.size.equalTo(CGSize(width: 100.pix(), height: 55.pix()))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ThreeView: UITableViewDelegate, UITableViewDataSource {

    @objc func naozhongClick() {
        self.gerenblock?()
    }
    
    @objc func gerenClick() {
        self.naozhongblock?()
    }
    
    @objc func addClick() {
        self.block?()
    }
    
    func getCurrentDateString() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: currentDate)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dict = array?[indexPath.row] as? [String: Any] else { return UITableViewCell() }
        let option_num = dict["option_num"] as! String
        if option_num == "3" {
            let cell = PetCheckViewCell(style: .subtitle, reuseIdentifier: "PetCheckViewCell")
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            if let dict = array?[indexPath.row] as? [String: Any] {
                cell.icon.kf.setImage(with: URL(string: dict["pet_img"] as! String))
                cell.name1.text = dict["amount_desc"] as? String
                cell.name2.text = dict["food1"] as? String
                cell.name3.text = dict["clean_desc"] as? String
                cell.name4.text = dict["food2"] as? String
                cell.name5.text = dict["refill_desc"] as? String
                cell.name6.text = dict["food3"] as? String
                cell.check_btn.kf.setImage(with: URL(string: dict["check_img"] as? String ?? ""), for: .normal)
                cell.block = { [weak self] in
                    self?.block1?(dict["pet_type"] as? String ?? "", dict["is_check"] as? String ?? "")
                }
            }
            return cell
        }else {
            let cell = PetTwoCheckCell(style: .subtitle, reuseIdentifier: "PetTwoCheckCell")
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            if let dict = array?[indexPath.row] as? [String: Any] {
                cell.icon.kf.setImage(with: URL(string: dict["pet_img"] as! String))
                cell.name1.text = dict["amount_desc"] as? String
                cell.name2.text = dict["food1"] as? String
                cell.name3.text = dict["clean_desc"] as? String
                cell.name4.text = dict["food2"] as? String
                cell.check_btn.kf.setImage(with: URL(string: dict["check_img"] as? String ?? ""), for: .normal)
                cell.block = { [weak self] in
                    self?.block1?(dict["pet_type"] as? String ?? "", dict["is_check"] as? String ?? "")
                }
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    @objc func btnleftClick() {
        self.leftblock?()
    }
    
    @objc func btnrightClick() {
        self.rightblock?()
    }
    
}
