//
//  TBNavigationController.swift
//  Tembin
//
//  Created by 河图。 on 16/8/17.
//  Copyright © 2016年 WC. All rights reserved.
//

import UIKit

class TBNavigationController: UINavigationController,UIGestureRecognizerDelegate {
  
  var transiting = false

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    setupNavigationBar()
    
//    
  }
  
  fileprivate func setupNavigationBar() {
    let bar = self.navigationBar
    bar.isTranslucent = false
    bar.shadowImage = UIImage()
    bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    bar.barTintColor = UIColor(red:69 / 255, green:153 / 255, blue:249 / 255, alpha:1.00)
    bar.tintColor = UIColor.white
    bar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    


  }
  
  func back(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  
  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
      return self.viewControllers.count > 1
    }
    return true
  }
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  
  
  
}
