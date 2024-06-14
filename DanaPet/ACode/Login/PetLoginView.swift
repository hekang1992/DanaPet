//
//  PetLoginView.swift
//  DanaPet
//
//  Created by apple on 2024/6/14.
//

import UIKit
import Lottie

class PetLoginView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()

    private lazy var hudView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "homeAview.json", bundle: Bundle.main)
        animationView.loopMode = .loop
        animationView.play()
        animationView.backgroundColor = UIColor("#FFD817")
        return animationView
    }()
    
    lazy var icon2ImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "Slicrty5hbvc")
        return iconImageView
    }()
    
    lazy var name1Label: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 24.pix())!, textColor: UIColor("#DDD0B6"), textAlignment: .center)
        nameLabel.text = "Log in or register with your phone number."
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    lazy var icon3ImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.isUserInteractionEnabled = true
        iconImageView.image = UIImage(named: "Slicfdasfsdatyug")
        return iconImageView
    }()
    
    lazy var tx: UITextField = {
        let tx = UITextField()
        tx.textAlignment = .center
        tx.font = UIFont(name: Coiny_Regular, size: 24.pix())
        let placeholderFont = UIFont(name: Coiny_Regular, size: 20.pix())
        let foregroundColor = UIColor("#DDD0B6")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: placeholderFont!,
            .foregroundColor: foregroundColor
        ]
        tx.attributedPlaceholder = NSAttributedString(string: "Phone number", attributes: placeholderAttributes)
        return tx
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "hidelogiin"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(hudView)
        hudView.addSubview(icon2ImageView)
        icon2ImageView.addSubview(name1Label)
        addSubview(icon3ImageView)
        icon3ImageView.addSubview(tx)
        addSubview(btn)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hudView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(450.pix())
        }
        icon2ImageView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(80.pix())
        }
        name1Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20.pix())
        }
        icon3ImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(icon2ImageView.snp.bottom).offset(40.pix())
            make.left.equalToSuperview().offset(20.pix())
            make.height.equalTo(73.pix())
        }
        tx.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(icon3ImageView.snp.bottom).offset(30.pix())
            make.left.equalToSuperview().offset(20.pix())
            make.height.equalTo(73.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PetLoginView {
    

}
