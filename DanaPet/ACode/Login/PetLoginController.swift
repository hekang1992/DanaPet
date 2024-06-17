//
//  PetLoginController.swift
//  DanaPet
//
//  Created by apple on 2024/6/14.
//

import UIKit
import MBProgressHUD_WJExtension

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
        loginView.block = { [weak self] in
            self?.nextPetVc()
        }
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension PetLoginController {
    
    func nextPetVc() {
        addHudView()
        let phoneStr: String = self.loginView.tx.text ?? ""
        let dict = ["pet_phone": phoneStr]
        NetApiWork.shared.requestACodeAPI(params: dict, pageUrl: petsendcode, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                self?.codeVc(phoneStr)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func codeVc(_ phoneStr: String) {
        let codeVc = PetCodeViewController()
        codeVc.phoneStr = phoneStr
        self.navigationController?.pushViewController(codeVc, animated: true)
    }
}
