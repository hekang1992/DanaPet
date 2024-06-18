//
//  PetTwoCheckCell.swift
//  DanaPet
//
//  Created by apple on 2024/6/18.
//

import UIKit

class PetTwoCheckCell: UITableViewCell {
    
    var block: (() -> Void)?

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#FFFDF2")
        bgView.layer.cornerRadius = 25.pix()
        bgView.layer.borderWidth = 4.pix()
        bgView.layer.borderColor = UIColor("#313131").cgColor
        return bgView
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        return icon
    }()

    lazy var name1: UILabel = {
        let name1 = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 13.pix())!, textColor: UIColor("#DDD0B6"), textAlignment: .left)
        return name1
    }()
    
    lazy var name2: UILabel = {
        let name1 = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 16.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        return name1
    }()
    
    lazy var name3: UILabel = {
        let name1 = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 13.pix())!, textColor: UIColor("#DDD0B6"), textAlignment: .left)
        return name1
    }()
    
    lazy var name4: UILabel = {
        let name1 = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 16.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        return name1
    }()
    
    lazy var check_btn: UIButton = {
        let check_btn = UIButton(type: .custom)
        check_btn.addTarget(self, action: #selector(checkBtnClick), for: .touchUpInside)
        return check_btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(icon)
        bgView.addSubview(name1)
        bgView.addSubview(name2)
        bgView.addSubview(name3)
        bgView.addSubview(name4)
        bgView.addSubview(check_btn)
        bgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(160.pix())
        }
        icon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 70.pix(), height: 44.pix()))
            make.left.equalToSuperview().offset(27.pix())
        }
        name1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(38.pix())
            make.left.equalTo(icon.snp.right).offset(21.pix())
            make.height.equalTo(15.pix())
        }
        name2.snp.makeConstraints { make in
            make.top.equalTo(name1.snp.bottom).offset(5.pix())
            make.left.equalTo(icon.snp.right).offset(21.pix())
            make.height.equalTo(18.pix())
        }
        name3.snp.makeConstraints { make in
            make.top.equalTo(name2.snp.bottom).offset(9.pix())
            make.left.equalTo(icon.snp.right).offset(21.pix())
            make.height.equalTo(15.pix())
        }
        name4.snp.makeConstraints { make in
            make.top.equalTo(name3.snp.bottom).offset(5.pix())
            make.left.equalTo(icon.snp.right).offset(21.pix())
            make.height.equalTo(18.pix())
        }
        check_btn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8.pix())
            make.top.equalToSuperview().offset(8.pix())
            make.bottom.equalToSuperview().offset(-8.pix())
            make.width.equalTo(73.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension PetTwoCheckCell {
    
    
    @objc func checkBtnClick() {
        self.block?()
    }
}
