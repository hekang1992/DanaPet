//
//  PetLoginView.swift
//  DanaPet
//
//  Created by apple on 2024/6/14.
//

import UIKit
import Lottie

class PetLoginView: UIView {
    
    var block: (() -> Void)?
    
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
        tx.keyboardType = .numberPad
        tx.textAlignment = .center
        tx.delegate = self
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
        btn.isEnabled = false
        btn.setImage(UIImage(named: "hidelogiin"), for: .normal)
        btn.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var agreeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Rectannormal"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 18.pix())!, textColor: UIColor("#DDD0B6"), textAlignment: .left)
        nameLabel.text = "I have read and agree to the terms Of service"
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(hudView)
        hudView.addSubview(icon2ImageView)
        icon2ImageView.addSubview(name1Label)
        addSubview(icon3ImageView)
        icon3ImageView.addSubview(tx)
        scrollView.addSubview(btn)
        scrollView.addSubview(agreeBtn)
        scrollView.addSubview(titleLabel)
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
        agreeBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30.pix())
            make.size.equalTo(CGSize(width: 40.pix(), height: 40.pix()))
            make.top.equalTo(btn.snp.bottom).offset(18.pix())
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(agreeBtn.snp.top).offset(10.pix())
            make.left.equalTo(agreeBtn.snp.right).offset(5.pix())
            make.right.equalToSuperview().offset(-18.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PetLoginView: UITextFieldDelegate {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.setNeedsLayout()
        self.layoutIfNeeded()
        let maxY = CGRectGetMaxY(self.titleLabel.frame)
        self.scrollView.contentSize = CGSize(width: 0, height: maxY + 40.pix())
    }
    
    @objc func btnClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
        if sender.isSelected {
            btn.isEnabled = true
            titleLabel.textColor = UIColor("#313131")
            sender.setImage(UIImage(named: "Rectansel"), for: .normal)
            btn.setImage(UIImage(named: "Groupfdas"), for: .normal)
        }else {
            btn.isEnabled = false
            titleLabel.textColor = UIColor("#DDD0B6")
            sender.setImage(UIImage(named: "Rectannormal"), for: .normal)
            btn.setImage(UIImage(named: "hidelogiin"), for: .normal)
        }
    }
    
    @objc func nextClick() {
        self.block?()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        return newText.count <= 16
        
    }
    
}
