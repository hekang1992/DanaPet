//
//  PetCodeViewController.swift
//  DanaPet
//
//  Created by apple on 2024/6/14.
//

import UIKit
import MBProgressHUD_WJExtension

class PetCodeViewController: BaseViewController {
    
    var phoneStr: String = ""
    
    var countdownTimer: Timer?
    
    var remainingTime = 60
    
    var verifyButton: UIButton?
    
    lazy var codeView: PetCodeView = {
        let codeView = PetCodeView()
        codeView.backgroundColor = UIColor("#FFFDF2")
        return codeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(codeView)
        codeView.block = { [weak self] in
            self?.loginVc()
        }
        codeView.block1 = { [weak self] btn in
            self?.codeApi(btn)
        }
        codeView.block2 = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        codeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        verifyButton = codeView.codeBtn
        startCountdown()
    }
}

extension PetCodeViewController {
    
    func codeApi(_ btn: UIButton) {
        sendCode()
    }
    
    func startCountdown() {
        verifyButton?.isEnabled = false
        verifyButton?.setTitle("\(remainingTime)s", for: .normal)
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        if remainingTime > 0 {
            remainingTime -= 1
            verifyButton?.setTitle("\(remainingTime)s", for: .normal)
        } else {
            stopCountdown()
        }
    }
    
    func stopCountdown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        remainingTime = 60
        verifyButton?.isEnabled = true
        verifyButton?.setTitle("Send", for: .normal)
    }
    
    func sendCode() {
        let dict = ["pet_phone": phoneStr]
        NetApiWork.shared.requestACodeAPI(params: dict, pageUrl: petsendcode, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                self?.startCountdown()
            }
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { error in
            
        }
    }
    
    func loginVc() {
        let dict = ["pet_phone": phoneStr, "pet_sms_code": codeView.tx.text ?? ""] as [String : Any]
        NetApiWork.shared.requestACodeAPI(params: dict, pageUrl: petlogin, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                let pet_data = baseModel.pet_data
                let pet_phone = pet_data?["pet_phone"]
                SaveLoginInfo.removeLoginInfo()
                SaveLoginInfo.saveLoginInfo(pet_phone as! String, pet_phone as! String)
                self?.navigationController?.popToRootViewController(animated: true)
            }
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { error in
            
        }
    }
    
}


