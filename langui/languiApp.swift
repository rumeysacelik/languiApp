//
//  languiApp.swift
//  langui
//
//  Created by Rumeysa on 29.04.2024.
//

import SwiftUI
import FirebaseCore // FirebaseCore eklemeyi unutmayın

@main
struct languiApp: App {
    
    // AppDelegate'i kullanmak için
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if delegate.authService?.currentUser != nil {
                MainTabView()
            }else {
                LoginOrRegisterView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private(set) var authService : AuthService?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        authService = AuthService()
        return true
    }
}
