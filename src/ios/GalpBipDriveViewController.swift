//
//  ViewController.swift
// 
//  Created by Ronélio Oliveira on 07/02/2023.
//

import UIKit
import BipDriveCore
import BipDriveParkingmeters

class GalpBipDriveViewController: UIViewController, BDResultsDelegate {
    func didGetError(response: BipDriveCore.BDErrorResponse) {
        print(response.errorDescription ?? "")
    }
    
    
    var resource = "";

    override func viewDidLoad() {

        let filePath = Bundle.main.path(forResource: "Root", ofType: "plist")!
        let plist = NSDictionary(contentsOfFile: filePath)
        let config = BDConfig()
        config.appID = plist?.object(forKey: "BDriveAppId") as? String
        config.appKey = plist?.object(forKey: "BDriveAppKey") as? String
        config.clientID = plist?.object(forKey: "BDriveAppClient") as? String
        let vc = BDParkingmetersAssembler.setUp(credentials: config, resultsDelegate: self, language: "es")
        self.present(vc, animated: true, completion: nil)       
    }
}
