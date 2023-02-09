
import UIKit
import BipDriveCore
import BipDriveParkingmeters


@objc(GalpBipDriveImpl) class GalpBipDriveImpl : CDVPlugin, BDResultsDelegate {
    
    var pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK
    )
    
    var callbackId: String!;
    
    func didGetError(response: BipDriveCore.BDErrorResponse) {
        pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )
        self.commandDelegate!.send(
          pluginResult,
          callbackId: self.callbackId
        )
    }

  @objc(launchParkingMeter:)
  func launchParkingMeter(_ command: CDVInvokedUrlCommand) {

      self.callbackId = command.callbackId;
      
      if(command.methodName == "launchParkingMeter") {
          
          var pListInfo: [String: Any]?
                  
          if let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
              do {
                  let infoPlistData = try Data(contentsOf: infoPlistPath)
                  
                  if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                      pListInfo = dict
                      
                      let config = BDConfig()
                      config.appID = pListInfo!["BDriveAppId"] as? String
                      config.appKey = pListInfo!["BDriveAppKey"] as? String
                      config.clientID = pListInfo!["BDriveAppClient"] as? String
                      DispatchQueue.main.async {
                          let vc = BDParkingmetersAssembler.setUp(credentials: config, resultsDelegate: self, language: "es")
                          self.viewController.present(vc, animated: true)
                      }
                  }
              } catch {
                  print(error)
                  pluginResult = CDVPluginResult(
                      status: CDVCommandStatus_ERROR
                  )
                  self.commandDelegate!.send(
                    pluginResult,
                    callbackId: command.callbackId
                  )
              }
          }

      } else {
          pluginResult = CDVPluginResult(
              status: CDVCommandStatus_ERROR
          )
          self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
          )
      }
  }
}
