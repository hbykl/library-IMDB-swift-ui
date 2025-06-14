import UIKit
import FirebaseAppCheck
import FirebaseCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        if #available(iOS 14.0, *) {
            let providerFactory = FirebaseAppCheck.DeviceCheckProviderFactory()
                    AppCheck.setAppCheckProviderFactory(providerFactory)
                } else {
                
                }
        
        return true
    }
    
    }
