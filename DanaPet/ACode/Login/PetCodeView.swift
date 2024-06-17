//
//  PetCodeView.swift
//  DanaPet
//
//  Created by apple on 2024/6/14.
//

import UIKit
import Lottie

class PetCodeView: UIView {

    var block: (() -> Void)?
    
    var block1: ((UIButton) -> Void)?
    
    var block2: (() -> Void)?
    
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
        nameLabel.text = "The verification code has been sent.Please check."
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
        tx.delegate = self
        tx.keyboardType = .numberPad
        tx.textAlignment = .center
        tx.font = UIFont(name: Coiny_Regular, size: 24.pix())
        let placeholderFont = UIFont(name: Coiny_Regular, size: 20.pix())
        let foregroundColor = UIColor("#DDD0B6")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: placeholderFont!,
            .foregroundColor: foregroundColor
        ]
        tx.attributedPlaceholder = NSAttributedString(string: "Verification code", attributes: placeholderAttributes)
        return tx
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "loginpei"), for: .normal)
        btn.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var codeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Send", for: .normal)
        btn.titleLabel?.font = UIFont(name: Coiny_Regular, size: 20.pix())
        btn.setTitleColor(UIColor("#313131"), for: .normal)
        btn.addTarget(self, action: #selector(codeClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var backBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicebackyr"), for: .normal)
        btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hudView)
        hudView.addSubview(backBtn)
        hudView.addSubview(icon2ImageView)
        icon2ImageView.addSubview(name1Label)
        addSubview(icon3ImageView)
        icon3ImageView.addSubview(tx)
        icon3ImageView.addSubview(codeBtn)
        addSubview(btn)
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
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10.pix(), bottom: 0, right: 100.pix()))
        }
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(icon3ImageView.snp.bottom).offset(30.pix())
            make.left.equalToSuperview().offset(20.pix())
            make.height.equalTo(73.pix())
        }
        codeBtn.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(tx.snp.right)
        }
        backBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
            make.left.equalToSuperview().offset(10.pix())
            make.top.equalToSuperview().offset(44.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PetCodeView: UITextFieldDelegate {
    
    @objc func nextClick() {
        self.block?()
    }

    @objc func codeClick(_ sender: UIButton) {
        self.block1?(sender)
    }
    
    @objc func backClick() {
        self.block2?()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        return newText.count <= 6
        
    }
    
}
