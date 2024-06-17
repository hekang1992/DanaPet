//
//  ThreeView.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit

class ThreeView: UIView {
    
    var block: (() -> Void)?
    
    var naozhongblock: (() -> Void)?
    
    var gerenblock: (() -> Void)?

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "Slicebgiijfr")
        return bgImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 24.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.text = "Luma"
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
        tableView.backgroundColor = .red
        return tableView
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
        whiimageView.addSubview(timeLabel)
        addSubview(addBtn)
        addSubview(tableView)
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
            make.size.equalTo(CGSize(width: 275.pix(), height: 241.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
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
            make.top.equalTo(timeLabel.snp.bottom).offset(4.pix())
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


extension ThreeView {
    
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
    
}
