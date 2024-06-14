//
//  SecondView.swift
//  DanaPet
//
//  Created by apple on 2024/6/11.
//

import UIKit

class SecondView: UIView {
    
    var selectedButtons: [[String: Any]] = []
    
    var block: (() -> Void)?
    
    var block1: (([[String: Any]]) -> Void)?
    
    var block2: (() -> Void)?
    
    var block3: (() -> Void)?
    
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
    
    lazy var naozhongBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Sliceren"), for: .normal)
        btn.addTarget(self, action: #selector(naozhongClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var peopleBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Slicerilifadf"), for: .normal)
        btn.addTarget(self, action: #selector(gerenClick), for: .touchUpInside)
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
    
    lazy var foodView: FoodView = {
        let foodView = FoodView()
        foodView.block = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        foodView.block1 = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        foodView.block2 = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        return foodView
    }()
    
    lazy var waterView: WaterView = {
        let waterView = WaterView()
        waterView.block = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        waterView.block1 = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        waterView.block2 = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        return waterView
    }()
    
    lazy var treatView: TreatsView = {
        let treatView = TreatsView()
        treatView.block = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        treatView.block1 = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        return treatView
    }()
    
    lazy var walkView: WalkView = {
        let walkView = WalkView()
        walkView.block = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        walkView.block1 = { [weak self] dict in
            self?.addDictionaryToArr(dict)
        }
        return walkView
    }()
    
    lazy var saveBtn: UIButton = {
        let saveBtn = UIButton(type: .custom)
        saveBtn.setImage(UIImage(named: "Slicefadq"), for: .normal)
        saveBtn.addTarget(self, action: #selector(saveBtnClick), for: .touchUpInside)
        return saveBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(bgImageView)
        bgImageView.addSubview(btn)
        bgImageView.addSubview(naozhongBtn)
        bgImageView.addSubview(peopleBtn)
        bgImageView.addSubview(pbtn)
        bgImageView.addSubview(ibtn)
        scrollView.addSubview(bgImage1View)
        bgImageView.addSubview(bgImage2View)
        bgImage2View.addSubview(tx)
        scrollView.addSubview(foodView)
        scrollView.addSubview(waterView)
        scrollView.addSubview(treatView)
        scrollView.addSubview(walkView)
        scrollView.addSubview(saveBtn)
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
        naozhongBtn.snp.makeConstraints { make in
            make.top.equalTo(btn.snp.top)
            make.right.equalToSuperview().offset(-20.pix())
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
        }
        peopleBtn.snp.makeConstraints { make in
            make.right.equalTo(naozhongBtn.snp.left).offset(-10.pix())
            make.top.equalTo(btn.snp.top)
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
        foodView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(bgImage1View.snp.top).offset(30.pix())
            make.height.equalTo(466.pix())
        }
        waterView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(foodView.snp.bottom).offset(30.pix())
            make.height.equalTo(466.pix())
        }
        treatView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(waterView.snp.bottom).offset(30.pix())
            make.height.equalTo(280.pix())
        }
        walkView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(treatView.snp.bottom).offset(30.pix())
            make.height.equalTo(340.pix())
        }
        saveBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20.pix())
            make.top.equalTo(walkView.snp.bottom).offset(40.pix())
            make.height.equalTo(73.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SecondView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.saveBtn.setNeedsLayout()
        self.layoutIfNeeded()
        let maxY = CGRectGetMaxY(self.saveBtn.frame)
        self.scrollView.contentSize = CGSize(width: 0, height: maxY + 40.pix())
    }
    
    @objc func backClick() {
        self.block?()
    }
    
    @objc func saveBtnClick() {
        self.block1?(selectedButtons)
    }
    
    @objc func naozhongClick() {
        self.block2?()
    }
    
    @objc func gerenClick() {
        self.block3?()
    }
    
    func addDictionaryToArr(_ dictionary: [String: Any]) {
        // 检查数组中是否已经存在相同 key 的字典
        if let existingIndex = selectedButtons.firstIndex(where: { $0.keys == dictionary.keys }) {
            // 如果存在，则替换为最新的字典
            selectedButtons[existingIndex] = dictionary
        } else {
            // 如果不存在，则直接添加到数组中
            selectedButtons.append(dictionary)
        }
    }
    
}
