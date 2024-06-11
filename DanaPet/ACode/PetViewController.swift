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
