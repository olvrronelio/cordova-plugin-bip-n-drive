import BipDriveCore

@objc(GalpBipDriveImpl) class GalpBipDriveImpl : CDVPlugin {
  
  @objc(openObject:)
  func openObject(_ command: CDVInvokedUrlCommand) {
      var pluginResult = CDVPluginResult(
          status: CDVCommandStatus_OK
      )

      let filePath = Bundle.main.path(forResource: "Root", ofType: "plist")!
      let plist = NSDictionary(contentsOfFile: filePath)
      let BDriveAppId = plist?.object(forKey: "BDriveAppId")
      let BDriveAppKey = plist?.object(forKey: "BDriveAppKey")
      let BDriveAppClient = plist?.object(forKey: "BDriveAppClient")

      if(command.methodName == "openSDK") {
        let vc = BDParkingmetersAssembler.setUp(credentials: config, resultsDelegate: self, language: "es")
        self.present(vc, animated: true, completion: nil)
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
