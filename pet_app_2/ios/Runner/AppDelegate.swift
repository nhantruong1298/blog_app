import UIKit
import Flutter
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
 override func application(
   _ application: UIApplication,
   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
 ) -> Bool {
   GeneratedPluginRegistrant.register(with: self)
     if #available(iOS 13.0, *) {
      
      } else {
          FirebaseApp.configure()
      }
   return super.application(application, didFinishLaunchingWithOptions: launchOptions)
 }
}


// class AppDelegate: NSObject, UIApplicationDelegate {
//   func application(_ application: UIApplication,
//                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//     FirebaseApp.configure()

//     return true
//   }
// }

// @main
// struct YourApp: App {
//   // register app delegate for Firebase setup
//   @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


//   var body: some Scene {
//     WindowGroup {
//       NavigationView {
//         ContentView()
//       }
//     }
//   }
// }
