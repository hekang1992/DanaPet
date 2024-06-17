//
//  PetCheckViewCell.swift
//  DanaPet
//
//  Created by apple on 2024/6/17.
//

import UIKit

class PetCheckViewCell: UITableViewCell {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#FFFDF2")
        bgView.layer.cornerRadius = 25.pix()
        bgView.layer.borderWidth = 4.pix()
        bgView.layer.borderColor = UIColor("#313131").cgColor
        return bgView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(160.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
