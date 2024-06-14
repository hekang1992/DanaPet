//
//  ThreeViewController.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit

class ThreeViewController: BaseViewController {
    
    lazy var threeView: ThreeView = {
        let threeView = ThreeView()
        threeView.backgroundColor = UIColor("#FFFDF2")
        return threeView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(threeView)
        threeView.block = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        threeView.gerenblock = { [weak self] in
            let fourVc = FourViewController()
            self?.navigationController?.pushViewController(fourVc, animated: true)
        }
        threeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
