//
//  TestApp.swift
//  Test
//
//  Created by Oliver Pavlovsky on 18/07/2022.
//

import SwiftUI
import GoogleMaps
 
 let APIKey = ""

class AppDelegate: NSObject, UIApplicationDelegate    {
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         GMSServices.provideAPIKey(APIKey)
         return true
     }
 }

@main
struct TestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .onAppear{
                    
                }
        }
    }
}
