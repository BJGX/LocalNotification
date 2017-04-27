//
//  AppDelegate.swift
//  本地推送页面跳转
//
//  Created by tembin on 2017/4/25.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let tabBarVC = TBTabBarController()
    window!.rootViewController = tabBarVC
    window!.makeKeyAndVisible()
    
    let set = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
    UIApplication.shared.registerUserNotificationSettings(set)
    
    
    // 程序被杀死时跳转页面
    if let options = launchOptions {
      if let notification = options[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification  {
        let userInfo = notification.userInfo
        let apsInfo = userInfo?["id"] as? String
        // 展示推送的信息
        let alert = UIAlertView(title: "\(userInfo!)", message: nil, delegate: nil, cancelButtonTitle: "确定")
        alert.show()
        if apsInfo == "detail" {
          //页面跳转
          let VC = UIStoryboard(name: "Discover", bundle: nil).instantiateViewController(withIdentifier: "Message") as! MessageDetailViewController
          VC.isForNotification = true
          let nc = TBNavigationController(rootViewController: VC)
          self.window?.rootViewController?.present(nc, animated: true, completion: nil)
        }
      }
    }
    
    
    return true
  }
  
  
  func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    //程序后台
    if UIApplication.shared.applicationState == UIApplicationState.inactive && UIApplication.shared.applicationState != UIApplicationState.background {
      guard let userInfos = notification.userInfo else {
        return
      }
      let apsInfo = userInfos["id"] as? String
      print(userInfos)
      if apsInfo == "detail" {
        let VC = UIStoryboard(name: "Discover", bundle: nil).instantiateViewController(withIdentifier: "Message") as! MessageDetailViewController
        let nc = TBNavigationController(rootViewController: VC)
        VC.isForNotification = true
        self.window?.rootViewController?.present(nc, animated: true, completion: nil)
      }
    }
    //程序前台
    if application.applicationState == UIApplicationState.active {
      guard let userInfo = notification.userInfo else {
        return
      }
//      let alert = UIAlertView(title: "\(userInfo)", message: nil, delegate: nil, cancelButtonTitle: "确定")
//      alert.show()
    }
  }
  
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    
    
    
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

