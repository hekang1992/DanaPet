//
//  FourView.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit

class FourView: UIView {
    
    var block: (() -> Void)?
    
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
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        bgImageView.addSubview(btn)
        addSubview(bgImage1View)
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FourView {
    
    @objc func backClick() {
        self.block?()
    }
}
