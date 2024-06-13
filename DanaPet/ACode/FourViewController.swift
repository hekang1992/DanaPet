//
//  FourViewController.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit

class FourViewController: BaseViewController {
    
    lazy var fourView: FourView = {
        let fourView = FourView()
        fourView.backgroundColor = UIColor("#FFFDF2")
        return fourView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(fourView)
        fourView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        fourView.snp.makeConstraints { make in
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
