//
//  CommonParams.swift
//  DanaPet
//
//  Created by apple on 2024/2/28.
//

import UIKit
import DeviceKit

class CommonParams: NSObject {
    
    static func getParas() -> String{
        let snailZuc: String = "ios"
        let seagullR: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let jacketNi: String = Device.current.name ?? ""
        let zucchini: String = DeviceInfo.finely()
        let zuccwww: String = DeviceInfo.column()
        let kiwiUgli: String = "app-flexi"
        let inkMango: String = USER_DEFAULTS.object(forKey: LOGIN_SEIZES) as? String ?? ""
        let xylophon: String = DeviceInfo.finely()
        let cleaved: String = "cat"
        let pet_phone: String = inkMango
        let lastUrl: String = "snailZuc=\(snailZuc)&seagullR=\(seagullR)&jacketNi=\(jacketNi)&zucchini=\(zucchini)&zuccwww=\(zuccwww)&kiwiUgli=\(kiwiUgli)&inkMango=\(inkMango)&xylophon=\(xylophon)&cleaved=\(cleaved)&pet_phone=\(pet_phone)"
        return lastUrl
    }
}
