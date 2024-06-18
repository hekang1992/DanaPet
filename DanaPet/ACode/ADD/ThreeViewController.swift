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
        threeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        threeView.nameLabel.text = pet_name
        let imageUrl = URL(string: pet_img)
        threeView.maoImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "Slicemao"))
        threeView.block1 = { [weak self] str, ischeck in
            self?.checkType(petid: self?.pet_id ?? "", pettype: str, ischeck: ischeck)
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
    
}


