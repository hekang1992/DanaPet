//
//  PetButtonView.swift
//  DanaPet
//
//  Created by apple on 2024/6/18.
//

import UIKit

class PetButtonView: UIView {
    
    var block: (() -> Void)?

    lazy var icon: UIImageView = {
        let icon = UIImageView()
        return icon
    }()

    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 20.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        addSubview(nameLabel)
        addSubview(btn)
        icon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14.pix())
            make.bottom.equalToSuperview().offset(-2.pix())
            make.size.equalTo(CGSize(width: 58.pix(), height: 61.pix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(icon.snp.right).offset(6.pix())
            make.right.equalToSuperview().offset(-4.pix())
        }
        btn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PetButtonView {
    
    
    @objc func btnClick() {
        self.block?()
    }
}
