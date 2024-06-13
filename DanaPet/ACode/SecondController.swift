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
