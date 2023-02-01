import BipDriveCore

@objc(GalpBipDriveImpl) class GalpBipDriveImpl : CDVPlugin {
  
  @objc(openObject:)
  func openObject(_ command: CDVInvokedUrlCommand) {
      var pluginResult = CDVPluginResult(
          status: CDVCommandStatus_OK
      )
            
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
