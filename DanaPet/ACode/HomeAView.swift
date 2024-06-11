//
//  HomeAView.swift
//  DanaPet
//
//  Created by apple on 2024/6/11.
//

import UIKit
import Lottie
import UIColor_Hex_Swift

class HomeAView: UIView {

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
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "Slicfdasfewr")
        iconImageView.isUserInteractionEnabled = true
        return iconImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 24.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.text = "Hi!"
        return nameLabel
    }()
    
    lazy var icon1ImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "Slicemaoef")
        return iconImageView
    }()
    
    lazy var tx: UITextField = {
        let tx = UITextField()
        let placeholderFont = UIFont(name: Coiny_Regular, size: 20.pix())
        let foregroundColor = UIColor("#ECE2CF")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: placeholderFont!,
            .foregroundColor: foregroundColor
        ]
        tx.attributedPlaceholder = NSAttributedString(string: "Type to search pets", attributes: placeholderAttributes)
        return tx
    }()
    
    lazy var icon2ImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "Slicrty5hbvc")
        return iconImageView
    }()
    
    lazy var name1Label: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 24.pix())!, textColor: UIColor("#313131"), textAlignment: .center)
        nameLabel.text = "Your Pet"
        return nameLabel
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Sliceaddpet"), for: .normal)
        btn.addTarget(self, action: #selector(btnPetClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn1: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Sliceaddpet"), for: .normal)
        btn.addTarget(self, action: #selector(btnPetClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicestartfa"), for: .normal)
        btn.addTarget(self, action: #selector(btnPetClick), for: .touchUpInside)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(hudView)
        hudView.addSubview(iconImageView)
        hudView.addSubview(nameLabel)
        hudView.addSubview(icon1ImageView)
        iconImageView.addSubview(tx)
        hudView.addSubview(icon2ImageView)
        icon2ImageView.addSubview(name1Label)
        scrollView.addSubview(btn)
        scrollView.addSubview(btn1)
        scrollView.addSubview(btn2)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hudView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(450.pix())
        }
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(UIEdgeInsets(top: 145.pix(), left: 0, bottom: 0, right: 0))
            make.size.equalTo(CGSize(width: 329.pix(), height: 79.pix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(55.pix())
            make.left.equalToSuperview().offset(20.pix())
            make.size.equalTo(CGSize(width: 36.pix(), height: 28.pix()))
        }
        icon1ImageView.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.right).offset(5.pix())
            make.top.equalTo(nameLabel.snp.top)
            make.size.equalTo(CGSize(width: 25.pix(), height: 23.pix()))
        }
        tx.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(82.pix())
            make.right.equalToSuperview().offset(-10.pix())
            make.top.equalToSuperview()
        }
        icon2ImageView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(80.pix())
        }
        name1Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10.pix())
            make.size.equalTo(CGSize(width: 200.pix(), height: 23.pix()))
        }
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(icon2ImageView.snp.bottom).offset(22.pix())
            make.size.equalTo(CGSize(width: 335.pix(), height: 73.pix()))
        }
        btn1.snp.makeConstraints { make in
            make.top.equalTo(btn.snp.bottom).offset(20.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 335.pix(), height: 73.pix()))
        }
        btn2.snp.makeConstraints { make in
            make.top.equalTo(btn1.snp.bottom).offset(60.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 335.pix(), height: 73.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HomeAView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.btn2.setNeedsLayout()
        self.layoutIfNeeded()
        let maxY = CGRectGetMaxY(self.btn2.frame)
        self.scrollView.contentSize = CGSize(width: 0, height: maxY + 120.pix())
    }
    
    @objc func btnPetClick() {
        
    }
}
