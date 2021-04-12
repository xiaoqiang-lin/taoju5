import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    GeneratedPluginRegistrant.register(with: self)
    AMapServices.shared().apiKey = "8e7fdd6ce80879a122c2768ebed08f03"
    
    let amapFactory = Taoju5AMapViewFactory()
    self.registrar(forPlugin: "taoju5_amap")!.register(
        amapFactory,
                withId: "<taoju5_amap_view>")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
