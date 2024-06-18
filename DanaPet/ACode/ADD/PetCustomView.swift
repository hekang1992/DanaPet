//
//  PetCustomView.swift
//  DanaPet
//
//  Created by apple on 2024/6/17.
//

import UIKit
import SnapKit

class PetCustomView: UIView {
    
    var block:((String, String, String) -> Void)?
    
    var block1:((String) -> Void)?
    
    var array: [Any]? {
        didSet {
            setupUI()
        }
    }
    
    var view: PetButtonView?
    
    private var buttons: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        buttons.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        backgroundColor = UIColor("#FFFDF2")
        guard array?.count ?? 0 > 0 else {
            return
        }
        
        let columns = 2
        
        for i in 0..<(array?.count ?? 0) {
            let bgView = PetButtonView()
            let dict: [String: Any] = array?[i] as! [String : Any]
            let icon: String = dict["pet_img"] as! String
            let nameStr: String = dict["pet_name"] as! String
            let pet_id: String = dict["pet_id"] as! String
            bgView.icon.kf.setImage(with: URL(string: icon ))
            bgView.nameLabel.text = nameStr
            bgView.petID = pet_id
            bgView.backgroundColor = UIColor("#FFD817")
            bgView.layer.cornerRadius = 25.pix()
            bgView.layer.borderWidth = 4.pix()
            bgView.layer.borderColor = UIColor("#313131").cgColor
            bgView.block = { [weak self] in
                self?.block?(pet_id, icon, nameStr)
            }
            let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
            bgView.addGestureRecognizer(longPressRecognizer)
            addSubview(bgView)
            buttons.append(bgView)
            let row = i / columns
            let column = i % columns
            bgView.snp.makeConstraints { make in
                make.width.equalTo(160.pix())
                make.height.equalTo(73.pix())
                if row == 0 {
                    make.top.equalToSuperview()
                }else {
                    make.top.equalTo(buttons[i - columns].snp.bottom).offset(20.pix())
                }
                if column == 0 { 
                    make.left.equalToSuperview().offset(1.pix())
                }else {
                    make.left.equalTo(buttons[i - 1].snp.right).offset(15.pix())
                }
            }
        }
    }
}


extension PetCustomView {
    
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            if let view = gestureRecognizer.view as? PetButtonView {
                self.view = view
                view.btn1.isHidden = false
                view.block1 = {
                    self.block1?(self.view?.petID ?? "")
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let view = self.view {
            view.btn1.isHidden = true
        }
    }
    
}
