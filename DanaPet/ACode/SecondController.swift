//
//  SecondController.swift
//  DanaPet
//
//  Created by apple on 2024/6/11.
//

import UIKit

class SecondController: BaseViewController {
    
    lazy var sendView: SecondView = {
        let sendView = SecondView()
        sendView.backgroundColor = UIColor("#FFFDF2")
        return sendView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(sendView)
        sendView.block = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        sendView.block1 = { [weak self] array in
            self?.saveClick(array)
        }
        sendView.block2 = { [weak self] in
            let gerenVc = FourViewController()
            self?.navigationController?.pushViewController(gerenVc, animated: true)
        }
        sendView.block3 = { [weak self] in
            
        }
        sendView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SecondController {
    
    @objc func saveClick(_ array: [[String: Any]]) {
        print("array>>>>>>>>\(array)")
        let threeVc = ThreeViewController()
        self.navigationController?.pushViewController(threeVc, animated: true)
    }
}
