import UIKit
import Flutter

import ActivityKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //   UNUserNotificationCenter.current().delegate = self
    //   let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    //   let notificationChannel = FlutterMethodChannel(name: "com.example.recipeApp/local_notifications",
    //                                                  binaryMessenger: controller.binaryMessenger)
    //   notificationChannel.setMethodCallHandler({
    //     (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
    //       if #available(iOS 16.1, *) {
    //         switch (call.method) {
    //         case "showNotification":
    //           guard let args = call.arguments  as? [String: Any] else {
    //             return
    //           }
    //           if let data = args["data"] as? Dictionary<String, String> {
    //               self.createActivity(data: data, result: result)
    //           } else {
    //             result(FlutterError(code: "WRONG_ARGS", message: "argument are not valid, check if 'data' is valid", details: nil))
    //           }
    //           break
    //         default:
    //           break
    //         }
    //       } else {
    //         result(FlutterError(code: "WRONG_IOS_VERSION", message: "this version of iOS is not supported", details: nil))
    //       }
    //   })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
}

// struct LiveNotificationAttributes: ActivityAttributes {
//     public typealias NotificationState = ContentState
//     public struct ContentState: Codable, Hashable {
//         var title: String
//         var subtitle: String
//     }
// }

// struct NotificationValue: Identifiable {
//     var id: String = UUID().uuidString
//     var content: Dictionary<String, String>
//     var dateCreated: Date = Date()
//     var showNotification: Bool = false
// }

// struct LockScreenLiveActivityView: View {
//     var size: CGSize
//     var value: NotificationValue
//     @Binding var notifications: [NotificationValue]
//     var body: some View {
//         HStack(alignment: .center) {
//             if let image = UIImage(named: "AppIcon60x60") {
//                 Image(uiImage: image)
//                     .resizable()
//                     .aspectRatio(contentMode: .fit)
//                     .frame(width: 60, height: 60)
//                     .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//             }
            
//             VStack(alignment: .leading, spacing: 8) {
//                 Text(value.content["title"] ?? "")
//                     .fontWeight(.semibold)
//                     .foregroundColor(.white)
//                 Text(value.content["subtitle"] ?? "")
//                     .font(.caption)
//                     .foregroundColor(.gray)
//             }
//             .lineLimit(1)
//             .frame(maxWidth: .infinity, alignment: .leading)
//         }
//         .frame(width: value.showNotification ? size.width - 22 : 126, height: value.showNotification ? 100 : 37.33)
//         .offset(y: 11)
//         .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: value.showNotification)
//         .background {
//             RoundedRectangle(cornerRadius: value.showNotification ? 50 : 63, style: .continuous).fill(.black)
//         }
// //        .padding(10)
// //        .padding(.horizontal, 12)
//         .onChange(of: value.showNotification, perform: { newValue in
//             if newValue && notifications.indices.contains(index) {
//                 DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
//                     notifications[index].showNotification = false
                    
//                     DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
//                         notifications.remove(at: index)
//                     }
//                 }
//             }
//         })
//         .onAppear {
//             //
//             DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                 notifications[index].showNotification = true
//             }
//         }
//     }
    
//     var index: Int {
//         return notifications.firstIndex { CValue in
//             CValue.id == value.id
//         } ?? 0
//     }
// }
