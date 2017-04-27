//
//  HomeVC.swift
//  本地推送页面跳转
//
//  Created by tembin on 2017/4/25.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let noti = UILocalNotification()
    noti.repeatInterval = NSCalendar.Unit.minute
    noti.fireDate = Date().addingTimeInterval(-1*60)
    noti.timeZone = NSTimeZone.default
    noti.alertBody = "推送消息"
    noti.alertTitle = "test"
    noti.soundName = UILocalNotificationDefaultSoundName
    noti.userInfo = ["id": "detail"]
    noti.applicationIconBadgeNumber = 1
    noti.alertAction = "跳转"
    UIApplication.shared.scheduleLocalNotification(noti)
   
  }
  
  
  

}
