//
//  FourViewController.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit
import MBProgressHUD_WJExtension
import TYAlertController

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
        fourView.block1 = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        fourView.block2 = { [weak self] in
            
        }
        fourView.block3 = { [weak self] in
            
        }
        fourView.block4 = { [weak self] in
            self?.deleView()
        }
        fourView.block5 = { [weak self] in
            self?.logoView()
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

extension FourViewController {
    
    @objc func deleView() {
        let popView = APopDelView(frame: self.view.bounds)
        popView.mainLabel.text = "Cannot be recovered after deletion. Are you sure you want to delete?"
        let alertVC = TYAlertController(alert: popView, preferredStyle: .alert)
        self.present(alertVC!, animated: true)
        popView.block = { [weak self] in
            self?.delay(0.25, closure: {
                self?.dismiss(animated: true, completion: {
                    self?.deleApi()
                })
            })
        }
        popView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    @objc func logoView() {
        let popView = APopDelView(frame: self.view.bounds)
        popView.mainLabel.text = "Are you sure you want to log out?"
        let alertVC = TYAlertController(alert: popView, preferredStyle: .alert)
        self.present(alertVC!, animated: true)
        popView.block = { [weak self] in
            self?.delay(0.25, closure: {
                self?.dismiss(animated: true, completion: {
                    self?.logoApi()
                })
            })
        }
        popView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }

    func deleApi() {
        addHudView()
        NetApiWork.shared.requestACodeAPI(params: [:], pageUrl: petuserdel, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                SaveLoginInfo.removeLoginInfo()
                self?.navigationController?.popToRootViewController(animated: true)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func logoApi() {
        addHudView()
        NetApiWork.shared.requestACodeAPI(params: [:], pageUrl: petlogout, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                SaveLoginInfo.removeLoginInfo()
                self?.navigationController?.popToRootViewController(animated: true)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
}
