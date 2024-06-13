//
//  APopDelView.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit

class APopDelView: UIView {
    
    var block: (() -> Void)?

    var block1: (() -> Void)?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#FFFDF2")
        bgView.layer.cornerRadius = 25.pix()
        bgView.layer.borderWidth = 4.pix()
        bgView.layer.borderColor = UIColor("#313131").cgColor
        return bgView
    }()
    
    lazy var mainLabel: UILabel = {
        let mainLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 20.pix())!, textColor: UIColor("#313131"), textAlignment: .center)
        mainLabel.text = ""
        mainLabel.numberOfLines = 0
        return mainLabel
    }()
    
    lazy var leftBtn: UIButton = {
        let leftBtn = UIButton(type: .custom)
        leftBtn.titleLabel?.font = UIFont(name: Coiny_Regular, size: 20.pix())
        leftBtn.setTitleColor(UIColor("#DDD0B6"), for: .normal)
        leftBtn.setTitle("Confirm", for: .normal)
        leftBtn.backgroundColor = UIColor("#FFFDF2")
        leftBtn.layer.cornerRadius = 21.pix()
        leftBtn.addTarget(self, action: #selector(leftClick), for: .touchUpInside)
        return leftBtn
    }()
    
    lazy var rightBtn: UIButton = {
        let rightBtn = UIButton(type: .custom)
        rightBtn.titleLabel?.font = UIFont(name: Coiny_Regular, size: 20.pix())
        rightBtn.setTitleColor(UIColor("#DDD0B6"), for: .normal)
        rightBtn.setTitle("Cancel", for: .normal)
        rightBtn.backgroundColor = UIColor("#FFFDF2")
        rightBtn.layer.cornerRadius = 21.pix()
        rightBtn.addTarget(self, action: #selector(rightClick), for: .touchUpInside)
        return rightBtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(mainLabel)
        bgView.addSubview(leftBtn)
        bgView.addSubview(rightBtn)
        bgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 335.pix(), height: 200.pix()))
        }
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30.pix())
            make.left.equalToSuperview().offset(26.pix())
        }
        leftBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-21.pix())
            make.left.equalToSuperview().offset(21.5.pix())
            make.size.equalTo(CGSize(width: 112.pix(), height: 42.pix()))
        }
        rightBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-21.pix())
            make.right.equalToSuperview().offset(-21.5.pix())
            make.size.equalTo(CGSize(width: 112.pix(), height: 42.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension APopDelView {
    
    @objc func leftClick() {
        leftBtn.backgroundColor = UIColor("#FFD817")
        rightBtn.backgroundColor = UIColor("#FFFDF2")
        leftBtn.setTitleColor(UIColor("#313131"), for: .normal)
        rightBtn.setTitleColor(UIColor("#DDD0B6"), for: .normal)
        self.block?()
    }
    
    @objc func rightClick() {
        rightBtn.backgroundColor = UIColor("#FFD817")
        leftBtn.backgroundColor = UIColor("#FFFDF2")
        rightBtn.setTitleColor(UIColor("#313131"), for: .normal)
        leftBtn.setTitleColor(UIColor("#DDD0B6"), for: .normal)
        self.block1?()
    }
    
}
