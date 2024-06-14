//
//  PetViewController.swift
//  DanaPet
//
//  Created by apple on 2024/3/18.
//

import UIKit

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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
    
}
