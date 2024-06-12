//
//  SecondView.swift
//  DanaPet
//
//  Created by apple on 2024/6/11.
//

import UIKit

class SecondView: UIView {
    
    var block: (() -> Void)?
    
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

    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicebackyr"), for: .normal)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var rightBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicerilifadf"), for: .normal)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var pbtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Sliceleftw"), for: .normal)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var ibtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicerightfaw"), for: .normal)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var bgImage2View: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Slicewhitfadf")
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    lazy var tx: UITextField = {
        let tx = UITextField()
        tx.font = UIFont(name: Coiny_Regular, size: 24.pix())
        let placeholderFont = UIFont(name: Coiny_Regular, size: 20.pix())
        let foregroundColor = UIColor("#313131")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: placeholderFont!,
            .foregroundColor: foregroundColor
        ]
        tx.textAlignment = .center
        tx.attributedPlaceholder = NSAttributedString(string: "Enter your pet's name", attributes: placeholderAttributes)
        return tx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(bgImageView)
        bgImageView.addSubview(btn)
        bgImageView.addSubview(rightBtn)
        bgImageView.addSubview(pbtn)
        bgImageView.addSubview(ibtn)
        scrollView.addSubview(bgImage1View)
        bgImageView.addSubview(bgImage2View)
        bgImage2View.addSubview(tx)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bgImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(340.pix())
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
        rightBtn.snp.makeConstraints { make in
            make.top.equalTo(btn.snp.top)
            make.right.equalToSuperview().offset(-20.pix())
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
        }
        pbtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20.pix())
            make.size.equalTo(CGSize(width: 160.pix(), height: 79.pix()))
            make.top.equalTo(btn.snp.bottom).offset(22.pix())
        }
        ibtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20.pix())
            make.size.equalTo(CGSize(width: 160.pix(), height: 79.pix()))
            make.top.equalTo(btn.snp.bottom).offset(22.pix())
        }
        bgImage2View.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ibtn.snp.bottom).offset(20.pix())
            make.size.equalTo(CGSize(width: 336.pix(), height: 50.pix()))
        }
        tx.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SecondView {
    
    @objc func backClick() {
        self.block?()
    }
    
}
