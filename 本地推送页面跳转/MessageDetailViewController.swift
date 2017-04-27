//
//  MessageDetailViewController.swift
//  本地推送页面跳转
//
//  Created by tembin on 2017/4/25.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
  
  var isForNotification = false
		
  
  
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      if isForNotification {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        let backItme = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backItme

      }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func remove(_ sender: UIButton) {
//    let noti = UILocalNotification()
    UIApplication.shared.cancelAllLocalNotifications()
    
    
  }

  
  func back() {
    self.navigationController!.dismiss(animated: true, completion: nil)
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
