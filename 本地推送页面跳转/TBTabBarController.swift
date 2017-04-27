//
//  TBTabBarController.swift
//  Tembin
//
//  Created by 河图。 on 16/8/16.
//  Copyright © 2016年 WC. All rights reserved.
//

import UIKit

class TBTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
    setupChildControllers()

  }

  
  
  func checkNotification(_ text: String) {


      let messageDetailVC = UIStoryboard(name: "TBDiscover", bundle: nil).instantiateViewController(withIdentifier: "messageDetailView") as! MessageDetailViewController
      let nc = TBNavigationController(rootViewController: messageDetailVC)
      self.present(nc, animated: true, completion: nil)
    
  
  }
  
  fileprivate func setupChildControllers() {
    // 首页
    let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeVC
    setupOneChildVC(homeVC,
                    image: UIImage(named: "tabbar_home")!,
                    selectedImage: UIImage(named: "tabbar_home_selected")!,
                    title: "首页")
    
    // 发现
    let discoverVC = UIStoryboard(name: "Discover", bundle: nil).instantiateInitialViewController() as! DiscoverVC
    setupOneChildVC(discoverVC,
                    image: UIImage(named: "tabbar_discover")!,
                    selectedImage: UIImage(named: "tabbar_discover_selected")!,
                    title: "发现")

  }
  
  fileprivate func setupOneChildVC(_ vc: UIViewController, image: UIImage, selectedImage: UIImage, title: String) {
    vc.tabBarItem.title = title
    vc.tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
    vc.tabBarItem.selectedImage = selectedImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    
    let nc = TBNavigationController(rootViewController: vc)
    addChildViewController(nc)
  }
  
  fileprivate func setupTabBar() {
    let bar = self.tabBar
    bar.backgroundImage = UIImage()
//    bar.shadowImage = UIImage(named: "tabbar_shadow")
    bar.backgroundColor = UIColor.white
    bar.alpha = 1.0
  }
  

  override func viewWillAppear(_ animated: Bool) {
    self.selectedViewController?.beginAppearanceTransition(true, animated: animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.selectedViewController?.endAppearanceTransition()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    self.selectedViewController?.beginAppearanceTransition(false, animated: animated)
  }
  
  
  override func viewDidDisappear(_ animated: Bool) {
    self.selectedViewController?.endAppearanceTransition()
  }
  
}
