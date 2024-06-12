//
//  FoodView.swift
//  DanaPet
//
//  Created by apple on 2024/6/12.
//

import UIKit

class FoodView: UIView {
    
    var buttons: [UIButton] = []
    
    var butt1ons: [UIButton] = []
    
    var butt2ons: [UIButton] = []
    
    let rows = 2
    
    let columns = 3
    
    var titles: [String] = ["Daily","Weekly"]
    
    var titl1es: [String] = ["Twice daily","Daily"]
    
    var block: (([String: Any]) -> Void)?
    
    var block1: (([String: Any]) -> Void)?
    
    var block2: (([String: Any]) -> Void)?
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "Slicefoodfdsa")
        return icon
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 18.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.text = "Food"
        return nameLabel
    }()
    
    lazy var name1Label: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 18.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.text = "Amount"
        return nameLabel
    }()
    
    lazy var name2Label: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 18.pix())!, textColor: UIColor("#DDD0B6"), textAlignment: .left)
        nameLabel.text = "(1 cup per 10g)"
        return nameLabel
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor("#F0EBE1")
        return lineView
    }()
    
    lazy var name3Label: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 18.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.text = "Clean"
        return nameLabel
    }()
    
    lazy var line1View: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor("#F0EBE1")
        return lineView
    }()
    
    lazy var name4Label: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Coiny_Regular, size: 18.pix())!, textColor: UIColor("#313131"), textAlignment: .left)
        nameLabel.text = "Refill"
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        addSubview(nameLabel)
        addSubview(name1Label)
        addSubview(name2Label)
        addSubview(lineView)
        addSubview(name3Label)
        addSubview(line1View)
        addSubview(name4Label)
        
        icon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(132.pix())
            make.top.equalToSuperview()
            make.size.equalTo(CGSize(width: 50.pix(), height: 35.pix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(13.pix())
            make.top.equalTo(icon.snp.top)
            make.bottom.equalTo(icon.snp.bottom)
        }
        name1Label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25.pix())
            make.height.equalTo(20.pix())
            make.top.equalTo(icon.snp.bottom).offset(30.pix())
        }
        name2Label.snp.makeConstraints { make in
            make.left.equalTo(name1Label.snp.right).offset(5.pix())
            make.height.equalTo(20.pix())
            make.top.equalTo(icon.snp.bottom).offset(30.pix())
        }
        for i in 0..<rows * columns {
            let button = UIButton(type: .custom)
            button.setBackgroundImage(UIImage(named: "Slicenormalbrn"), for: .normal)
            button.titleLabel?.font = UIFont(name: Coiny_Regular, size: 17.pix())
            button.setTitle("\(i + 2) Cups", for: .normal)
            button.setTitleColor(UIColor("#DDD0B6"), for: .normal)
            button.tag = i + 10
            button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
            addSubview(button)
            buttons.append(button)
            button.snp.makeConstraints { make in
                let row = i / columns
                let column = i % columns
                make.top.equalTo(name2Label.snp.top).offset(40.pix() + CGFloat(row) * 60.pix())
                make.left.equalToSuperview().offset(20.pix() + CGFloat(column) * 115.pix())
                make.width.equalTo(95.pix())
                make.height.equalTo(45.pix())
            }
        }
        lineView.snp.makeConstraints { make in
            make.left.equalTo(name1Label.snp.left)
            make.top.equalTo(name1Label.snp.bottom).offset(145.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(1.pix())
        }
        name3Label.snp.makeConstraints { make in
            make.left.equalTo(name1Label.snp.left)
            make.top.equalTo(lineView.snp.bottom).offset(20.pix())
            make.size.equalTo(CGSize(width: 100.pix(), height: 20.pix()))
        }
        for i in 0..<2 {
            let button = UIButton(type: .custom)
            button.setBackgroundImage(UIImage(named: "Slicfdasfsdatyug"), for: .normal)
            button.titleLabel?.font = UIFont(name: Coiny_Regular, size: 17.pix())
            button.setTitle(titles[i], for: .normal)
            button.setTitleColor(UIColor("#DDD0B6"), for: .normal)
            button.tag = i + 20
            button.addTarget(self, action: #selector(button1Clicked(_:)), for: .touchUpInside)
            addSubview(button)
            butt1ons.append(button)
            button.snp.makeConstraints { make in
                make.top.equalTo(name3Label.snp.top).offset(40.pix())
                make.left.equalToSuperview().offset(20.pix() + CGFloat(i) * 180.pix())
                make.width.equalTo(160.pix())
                make.height.equalTo(45.pix())
            }
        }
        line1View.snp.makeConstraints { make in
            make.left.equalTo(name1Label.snp.left)
            make.top.equalTo(lineView.snp.bottom).offset(125.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(1.pix())
        }
        name4Label.snp.makeConstraints { make in
            make.left.equalTo(name1Label.snp.left)
            make.top.equalTo(line1View.snp.bottom).offset(20.pix())
            make.size.equalTo(CGSize(width: 100.pix(), height: 20.pix()))
        }
        for i in 0..<2 {
            let button = UIButton(type: .custom)
            button.setBackgroundImage(UIImage(named: "Slicfdasfsdatyug"), for: .normal)
            button.titleLabel?.font = UIFont(name: Coiny_Regular, size: 17.pix())
            button.setTitle(titl1es[i], for: .normal)
            button.setTitleColor(UIColor("#DDD0B6"), for: .normal)
            button.tag = i + 30
            button.addTarget(self, action: #selector(button2Clicked(_:)), for: .touchUpInside)
            addSubview(button)
            butt2ons.append(button)
            button.snp.makeConstraints { make in
                make.top.equalTo(name4Label.snp.top).offset(40.pix())
                make.left.equalToSuperview().offset(20.pix() + CGFloat(i) * 180.pix())
                make.width.equalTo(160.pix())
                make.height.equalTo(45.pix())
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FoodView {
    
    @objc func buttonClicked(_ sender: UIButton) {
        for button in buttons {
            button.setTitleColor(UIColor("#DDD0B6"), for: .normal)
            button.setBackgroundImage(UIImage(named: "Slicenormalbrn"), for: .normal)
        }
        sender.setTitleColor(UIColor("#313131"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "Sliceselffad"), for: .normal)
        let dataStr = String(sender.tag - 10)
        let dict = ["food1": dataStr]
        self.block?(dict)
    }
    
    @objc func button1Clicked(_ sender: UIButton) {
        for button in butt1ons {
            button.setTitleColor(UIColor("#DDD0B6"), for: .normal)
            button.setBackgroundImage(UIImage(named: "Slicfdasfsdatyug"), for: .normal)
        }
        sender.setTitleColor(UIColor("#313131"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "Slicfdasfsdatyutgvdxc"), for: .normal)
        let dataStr = String(sender.tag - 20)
        let dict = ["food2": dataStr]
        self.block1?(dict)
    }
    
    @objc func button2Clicked(_ sender: UIButton) {
        for button in butt2ons {
            button.setTitleColor(UIColor("#DDD0B6"), for: .normal)
            button.setBackgroundImage(UIImage(named: "Slicfdasfsdatyug"), for: .normal)
        }
        sender.setTitleColor(UIColor("#313131"), for: .normal)
        sender.setBackgroundImage(UIImage(named: "Slicfdasfsdatyutgvdxc"), for: .normal)
        let dataStr = String(sender.tag - 30)
        let dict = ["food3": dataStr]
        self.block2?(dict)
    }
    
}
