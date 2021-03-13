//
//  Social_ApplApp.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 2/27/21.
//

import SwiftUI
import Firebase


struct SocialApplApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//Initialize Firebase
class Appdelegate : NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
