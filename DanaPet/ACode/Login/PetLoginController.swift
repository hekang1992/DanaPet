//
//  PetLoginController.swift
//  DanaPet
//
//  Created by apple on 2024/6/14.
//

import UIKit

class PetLoginController: BaseViewController {
    
    lazy var loginView: PetLoginView = {
        let loginView = PetLoginView()
        loginView.backgroundColor = UIColor("#FFFDF2")
        return loginView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
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
