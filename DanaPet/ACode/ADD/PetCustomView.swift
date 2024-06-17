//
//  PetCustomView.swift
//  DanaPet
//
//  Created by apple on 2024/6/17.
//

import UIKit
import SnapKit

class PetCustomView: UIView {
    
    var buttonCount: Int = 0 {
        didSet {
            setupUI()
        }
    }
    
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
        guard buttonCount > 0 else {
            return
        }
        
        let columns = 2
        
        for i in 0..<buttonCount {
            let bgView = UIView()
            bgView.backgroundColor = .random()
            bgView.layer.cornerRadius = 25.pix()
            bgView.layer.borderWidth = 4.pix()
            bgView.layer.borderColor = UIColor("#313131").cgColor
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
                    make.left.equalToSuperview().offset(10.pix())
                }else {
                    make.left.equalTo(buttons[i - 1].snp.right).offset(15.pix())
                }
            }
        }
    }
}

