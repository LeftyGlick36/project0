//
//  AppDelegate.swift
//  Project 0
//
//  Created by Moses Manning on 5/15/16.
//  Copyright © 2016 Moses Manning. All rights reserved.
//

import UIKit
import HealthKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var aSlider: UISlider!
    var aLabel: UILabel!
    var bLabel: UILabel!
    var originalAValue: UILabel!
    var originalBValue: UILabel!
    var bSlider: UISlider!
    var bSliderChanged: Float = 0.0
    var aSliderChanged: Float = 0.0
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        let rootViewController: UIViewController = UIViewController()
        
        rootViewController.view.backgroundColor = UIColor.cyanColor()
        
        aSlider = UISlider(frame: CGRect(x: 10, y: 100, width: 200, height: 30))
        bSlider = UISlider(frame: CGRect(x: 10, y: 200, width: 200, height: 30))
        
        aSlider.maximumValue = 1.0
        aSlider.minimumValue = 0.0
        
        bSlider.maximumValue = 1.0
        bSlider.minimumValue = 0.0
        
        rootViewController.view.addSubview(aSlider)
        rootViewController.view.addSubview(bSlider)
        
        aSlider.addTarget(self, action: #selector(AppDelegate.sliderAChanged), forControlEvents: UIControlEvents.ValueChanged)
        bSlider.addTarget(self, action: #selector(AppDelegate.sliderBChanged), forControlEvents: UIControlEvents.ValueChanged)
        
        originalAValue = UILabel(frame: CGRect(x: 250, y: 100, width: 100, height: 30))
        originalAValue.text = "\(aSlider.value)"
        
        originalBValue = UILabel(frame: CGRect(x: 250, y: 200, width: 100, height: 30))
        originalBValue.text = "\(bSlider.value)"
        
        aLabel = UILabel(frame: CGRect(x: 125, y: 300, width: 300, height: 30))
        aLabel.text = "A: \(aSlider.value)"
        
        bLabel = UILabel(frame: CGRect(x: 125, y: 400, width: 300, height: 30))
        bLabel.text = "B: \(bSlider.value)"
        
        rootViewController.view.addSubview(aLabel)
        rootViewController.view.addSubview(bLabel)
        rootViewController.view.addSubview(originalAValue)
        rootViewController.view.addSubview(originalBValue)
        
        
        window = UIWindow()
        window!.rootViewController = rootViewController
        window!.makeKeyAndVisible()
        
        return true
    }
    
    
    func sliderAChanged() {

        originalAValue.text = "\(aSlider.value)"
        originalBValue.text = "\(bSlider.value)"
        
        aSliderChanged = (((originalAValue.text! as NSString).floatValue) + ((originalBValue.text! as NSString).floatValue))
        aLabel.text = "X + Y: \(aSliderChanged)"
        
        bSliderChanged = (originalBValue.text! as NSString).floatValue * (originalAValue.text! as NSString).floatValue
        bLabel.text = "X * Y: \(bSliderChanged)"
        
        
        aSlider.value = (originalAValue.text! as NSString).floatValue
        bSlider.value = (originalBValue.text! as NSString).floatValue
        
    }
    
    func sliderBChanged() {

        originalAValue.text = "\(aSlider.value)"
        originalBValue.text = "\(bSlider.value)"
        
        bSliderChanged = (originalBValue.text! as NSString).floatValue * (originalAValue.text! as NSString).floatValue
        bLabel.text = "X * Y: \(bSliderChanged)"
        aSliderChanged = (((originalAValue.text! as NSString).floatValue) + ((originalBValue.text! as NSString).floatValue))
        aLabel.text = "X + Y: \(aSliderChanged)"
        
        aSlider.value = (originalAValue.text! as NSString).floatValue
        bSlider.value = (originalBValue.text! as NSString).floatValue
        
        
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

