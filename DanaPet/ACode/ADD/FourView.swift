//
//  FourView.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit

class FourView: UIView {
    
    var block: (() -> Void)?
    
    var block1: (() -> Void)?
    
    var block2: (() -> Void)?
    
    var block3: (() -> Void)?
    
    var block4: (() -> Void)?
    
    var block5: (() -> Void)?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "Slicebgiijfr")
        return bgImageView
    }()
    
    lazy var bgImage1View: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Slicrty5hbvc")
        return bgImageView
    }()
    
    lazy var bgImage2View: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Slicfdasfdsybhfv")
        return bgImageView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicebackyr"), for: .normal)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 24.pix())!, textColor: UIColor("#313131"), textAlignment: .center)
        nameLabel.text = "Profile"
        return nameLabel
    }()
    
    lazy var btn1: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicepmvmf"), for: .normal)
        btn.addTarget(self, action: #selector(allClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicesupport"), for: .normal)
        btn.addTarget(self, action: #selector(supportClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn3: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Sliceterms"), for: .normal)
        btn.addTarget(self, action: #selector(termClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn4: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicedeldfjaftv"), for: .normal)
        btn.addTarget(self, action: #selector(deleClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn5: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicedeldfjaftvrfdcx"), for: .normal)
        btn.addTarget(self, action: #selector(logoutClick), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(bgImageView)
        bgImageView.addSubview(bgImage2View)
        bgImageView.addSubview(btn)
        bgImageView.addSubview(nameLabel)
        scrollView.addSubview(bgImage1View)
        scrollView.addSubview(btn1)
        scrollView.addSubview(btn2)
        scrollView.addSubview(btn3)
        scrollView.addSubview(btn4)
        scrollView.addSubview(btn5)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bgImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(300.pix())
        }
        bgImage1View.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(bgImageView.snp.bottom).offset(40.pix())
            make.height.equalTo(97.pix())
        }
        btn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
            make.left.equalToSuperview().offset(10.pix())
            make.top.equalToSuperview().offset(44.pix())
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(btn.snp.centerY)
            make.height.equalTo(25.pix())
        }
        bgImage2View.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 231.pix(), height: 127.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
        btn1.snp.makeConstraints { make in
            make.top.equalTo(bgImage2View.snp.bottom).offset(20.pix())
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(18.pix())
            make.size.equalTo(CGSize(width: 335.pix(), height: 73.pix()))
        }
        btn2.snp.makeConstraints { make in
            make.top.equalTo(btn1.snp.bottom).offset(20.pix())
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(18.pix())
            make.size.equalTo(CGSize(width: 335.pix(), height: 73.pix()))
        }
        btn3.snp.makeConstraints { make in
            make.top.equalTo(btn2.snp.bottom).offset(20.pix())
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(18.pix())
            make.size.equalTo(CGSize(width: 335.pix(), height: 73.pix()))
        }
        btn4.snp.makeConstraints { make in
            make.left.equalTo(btn1.snp.left)
            make.top.equalTo(btn3.snp.bottom).offset(40.pix())
            make.size.equalTo(CGSize(width: 160.pix(), height: 73.pix()))
        }
        btn5.snp.makeConstraints { make in
            make.right.equalTo(btn1.snp.right)
            make.top.equalTo(btn3.snp.bottom).offset(40.pix())
            make.size.equalTo(CGSize(width: 160.pix(), height: 73.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FourView {
    
    @objc func backClick() {
        self.block?()
    }
    
    @objc func allClick() {
        self.block1?()
    }
    
    @objc func supportClick() {
        self.block2?()
    }
    
    @objc func termClick() {
        self.block3?()
    }
    
    @objc func deleClick() {
        self.block4?()
    }
    
    @objc func logoutClick() {
        self.block5?()
    }
}


