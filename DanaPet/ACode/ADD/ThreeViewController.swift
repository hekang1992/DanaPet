//
//  ThreeViewController.swift
//  DanaPet
//
//  Created by apple on 2024/6/13.
//

import UIKit
import Kingfisher
import MBProgressHUD_WJExtension

class ThreeViewController: BaseViewController {
    
    var pet_id: String = ""
    
    var pet_img: String = ""
    
    var pet_name: String = ""
    
    var array: [Any]?
    
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
        threeView.naozhongblock = { [weak self] in
            self?.postNoti()
        }
        threeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        threeView.nameLabel.text = pet_name
        let imageUrl = URL(string: pet_img)
        threeView.maoImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "Slicemao"))
        threeView.block1 = { [weak self] str, ischeck in
            self?.checkType(petid: self?.pet_id ?? "", pettype: str, ischeck: ischeck)
        }
        threeView.leftblock = {
            
        }
        threeView.rightblock = {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkApi()
    }
    
}


extension ThreeViewController {
    
    func checkApi() {
        addHudView()
        let dict = ["pet_id": pet_id]
        NetApiWork.shared.requestACodeAPI(params: dict, pageUrl: petcheckpage, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            if pet_code == 0 || pet_code == 00 {
                if let petData = baseModel.pet_data {
                    if let diData = petData["pet_data"] as? [String: Any] {
                        if let petData = diData["pet_data"] as? [Any] {
                            self?.threeView.array = petData
                            self?.threeView.tableView.reloadData()
                        } else {
                            print("Could not cast di_data['pet_data'] to [String: Any]")
                        }
                    } else {
                        print("Could not cast pet_data['di_data'] to [String: Any]")
                    }
                } else {
                    print("Could not cast baseModel.pet_data to [String: Any]")
                }
                
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
        
    }
    
    func checkType(petid: String, pettype: String, ischeck: String) {
        addHudView()
        var chekcType: String?
        if ischeck == "1" {
            chekcType = "0"
        }else if ischeck == "0" {
            chekcType = "1"
        }
        let dict = ["pet_id": petid, "pet_type": pettype, "is_check": chekcType ?? ""] as [String: Any]
        print("dict>>>>\(dict)")
        NetApiWork.shared.requestACodeAPI(params: dict, pageUrl: petcheck, method: .post) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                self?.checkApi()
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
        
    }
    
    func postNoti() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "It's 9 AM! Time to do something."
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.hour = 9
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "MorningNotification", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                let alertController = UIAlertController(title: "Reminder", message: "It's 9 AM! Time to do something", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}

