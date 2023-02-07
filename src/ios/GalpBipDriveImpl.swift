
@objc(GalpBipDriveImpl) class GalpBipDriveImpl : CDVPlugin {
  
  @objc(openSDK:)
  func openSDK(_ command: CDVInvokedUrlCommand) {
      var pluginResult = CDVPluginResult(
          status: CDVCommandStatus_OK
      )

      if(command.methodName == "openSDK") {
          let storyboard = UIStoryboard(name: "GalpBipDrive", bundle: nil)
          let viewController = storyboard.instantiateViewController(withIdentifier: "mainView") as! GalpBipDriveViewController
          self.viewController.present(viewController, animated: true)
          self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
          )
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
