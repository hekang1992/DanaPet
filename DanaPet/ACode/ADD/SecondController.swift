//
//  SecondController.swift
//  DanaPet
//
//  Created by apple on 2024/6/11.
//

import UIKit
import Photos
import MBProgressHUD_WJExtension
import TYAlertController

class SecondController: BaseViewController {
    
    let imagePicker = UIImagePickerController()
    
    lazy var sendView: SecondView = {
        let sendView = SecondView()
        sendView.backgroundColor = UIColor("#FFFDF2")
        return sendView
    }()

    var pet_img: String?
    
    var pet_img1: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(sendView)
        sendView.block = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        sendView.block1 = { [weak self] array in
            self?.saveClick(array)
        }
        sendView.block2 = { [weak self] in
            let gerenVc = FourViewController()
            self?.navigationController?.pushViewController(gerenVc, animated: true)
        }
        sendView.block3 = { [weak self] in
            self?.postNoti()
        }
        sendView.block4 = { [weak self] in
            self?.xiangce()
        }
        sendView.block5 = { [weak self] in
            self?.openCamera()
        }
        sendView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SecondController: UIImagePickerControllerDelegate {
    @objc func saveClick(_ array: [[String: Any]]) {
        if pet_img?.isEmpty == true  {
            MBProgressHUD.wj_showPlainText("Please upload a pet image!", view: nil)
            return
            
        }else if (sendView.tx.text?.isEmpty == true) {
            MBProgressHUD.wj_showPlainText("Please enter the pet's name!", view: nil)
            return
        }else if (array.count != 10) {
            MBProgressHUD.wj_showPlainText("Please complete all the selections!", view: nil)
            return
        }
        addHudView()
        let dict = ["pet_name": sendView.tx.text ?? "", "pet_img": pet_img ?? "", "pet_id": "", "pet_food": array] as [String : Any]
        NetApiWork.shared.requestACodeAPI(params: dict, pageUrl: petadd, method: .put) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                let dict = baseModel.pet_data
                let pet_id = dict?["pet_id"] as! String
                let pet_img = dict?["pet_img"] as! String
                let pet_name = dict?["pet_name"] as! String
                let threeVc = ThreeViewController()
                threeVc.pet_id = pet_id
                threeVc.pet_img = pet_img
                threeVc.pet_name = pet_name
                self?.navigationController?.pushViewController(threeVc, animated: true)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(pet_msg ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }

    }
        
    func xiangce() {
        openPhotoLibrary()
    }
    
    func openCamera(_ index: Int) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            checkCameraPermission { [weak self] granted in
                if granted {
                    DispatchQueue.main.async {
                        self?.imagePicker.delegate = self
                        self?.imagePicker.delegate = self
                        self?.imagePicker.sourceType = .camera
                        if index == 0 {
                            self?.imagePicker.cameraDevice = .rear
                        }else {
                            self?.imagePicker.cameraDevice = .front
                        }
                        self?.present(self!.imagePicker, animated: true)
                    }
                } else {
                    
                }
            }
        } else {
            print("Device doesn't support camera.")
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            checkCameraPermission { [weak self] granted in
                if granted {
                    DispatchQueue.main.async {
                        self?.imagePicker.delegate = self
                        self?.imagePicker.delegate = self
                        self?.imagePicker.sourceType = .camera
                        self?.present(self!.imagePicker, animated: true)
                    }
                } else {
                    
                }
            }
        } else {
            print("Device doesn't support camera.")
        }
    }
    
    func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            checkPhotoPermission { [weak self] (granted) in
                if granted {
                    DispatchQueue.main.async {
                        self?.imagePicker.delegate = self
                        self?.imagePicker.sourceType = .photoLibrary
                        if let imagePicker = self?.imagePicker{
                            self?.present(imagePicker, animated: true, completion: nil)
                        }
                    }
                }
            }
            
        } else {
            print("Device doesn't support photo library.")
        }
    }
    
    func checkCameraPermission(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted:
            self.wanLiuACodeView("Permission not granted. Would you like to go to the settings?")
            completion(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                completion(granted)
            }
        @unknown default:
            self.wanLiuACodeView("Permission not granted. Would you like to go to the settings?")
            completion(false)
        }
    }
    
    func checkPhotoPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted:
            self.wanLiuACodeView("You haven't granted access to the gallery. Please go to the settings.")
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                if newStatus == PHAuthorizationStatus.authorized {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        case .limited:
            completion(true)
        @unknown default:
            self.wanLiuACodeView("You haven't granted permission to access the gallery. Please go to the settings.")
            completion(false)
        }
    }
    
    func wanLiuACodeView(_ title: String) {
        let exitView = ExitView()
        exitView.descLabel.text = title
        exitView.sureBtn.setTitle("Sure", for: .normal)
        exitView.cancelBtn.setTitle("Cancel", for: .normal)
        exitView.sureBtn.backgroundColor = UIColor("#FFD916")
        exitView.sureBtn.setTitleColor(.white, for: .normal)
        exitView.cancelBtn.backgroundColor = UIColor("#FFFFFF")
        exitView.cancelBtn.setTitleColor(.black, for: .normal)
        exitView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: exitView, preferredStyle: .alert)
        self.present(alertVC!, animated: true)
        exitView.block = { [weak self] in
            self?.dismiss(animated: true, completion: {
                self?.goSet()
            })
        }
        exitView.cblock = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let data = Data.compressQuality(image: image!, maxLength: 1024)
        picker.dismiss(animated: true) { [weak self] in
            self?.setUpLoadImage(data!,image!)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setUpLoadImage(_ data: Data, _ image: UIImage) {
        addHudView()
        NetApiWork.shared.uploadACodeImageAPI(params: [:], pageUrl: petupload, method: .post, data: data) { [weak self] baseModel in
            let pet_code = baseModel.pet_code
            let pet_msg = baseModel.pet_msg
            if pet_code == 0 || pet_code == 00 {
                let dict = baseModel.pet_data
                let pet_img = dict?["pet_img"] as! String
                self?.pet_img = pet_img
                self?.sendView.pbtn.setImage(image, for: .normal)
                self?.sendView.ibtn.setImage(image, for: .normal)
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
