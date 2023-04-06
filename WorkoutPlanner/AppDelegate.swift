//
//  AppDelegate.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 4/6/23.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            guard let url = userActivity.webpageURL else{
                return false
            }
            
            guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                return false
            }
            
            print(urlComponents.queryItems)
        }
    }
}
