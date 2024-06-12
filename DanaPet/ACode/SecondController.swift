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
        sendView.snp.makeConstraints { make in
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
