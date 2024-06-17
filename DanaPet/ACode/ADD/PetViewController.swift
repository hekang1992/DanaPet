//
//  PetViewController.swift
//  DanaPet
//
//  Created by apple on 2024/3/18.
//

import UIKit
import MBProgressHUD_WJExtension

class PetViewController: BaseViewController{
    
    lazy var homeView: HomeAView = {
        let homeView = HomeAView()
        homeView.backgroundColor = UIColor("#FFFDF2")
        return homeView
    }()
    
    override func viewDidLoad() {
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        homeView.block1 = { [weak self] in
            if IS_LOGIN {
                self?.nextVc()
            }else {
                self?.loginVc()
            }
            
        }
        
        homeView.block2 = { [weak self] in
            if IS_LOGIN {
                self?.nextVc()
            }else {
                self?.loginVc()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        allPetApi()
    }
    
}


extension PetViewController {
    
    func nextVc() {
        let sendVc = SecondController()
        self.navigationController?.pushViewController(sendVc, animated: true)
    }
    
    func loginVc() {
        let loginVc = PetLoginController()
        self.navigationController?.pushViewController(loginVc, animated: true)
    }
    
    func allPetApi() {
        addHudView()
        NetApiWork.shared.requestACodeAPI(params: [:], pageUrl: pethome, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                let dict = baseModel.pet_data
                let pets = dict?["pets"] as! [Any]
                self?.homeView.array = pets
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }

    }
    
}
