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
//        getAllWorkoutImages()
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
        return true
    }
}

func callGitAPI(){
    if let appURL = URL(string: "https://github.com/deepaksingh4/expense_manager/forgotpassword") {
        UIApplication.shared.open(appURL) { success in
            if success {
                print("The URL was delivered successfully.")
            } else {
                print("The URL failed to open.")
            }
        }
    } else {
        print("Invalid URL specified.")
    }
}
