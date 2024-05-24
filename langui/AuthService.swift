//
//  LoginService.swift
//  langui
//
//  Created by Mehmet Emin Ak on 24.05.2024.
//

import Foundation
import FirebaseAuth
import SwiftUI

final class AuthService : ObservableObject {
    
    private let auth = Auth.auth()
    private let validator = Validator()
    
    @Published private(set) public var currentUser : User?
    @Published var authErrorMessage : String?
    
    init() {
        setCurrentUser()
    }
    
    func signInWithCredentials(email : String,password : String){
        
        if (validator.validateEmail(email) && validator.validatePassword(password)) {
            auth.signIn(withEmail: email, password: password) { [weak self] res, err in
                
                guard let self else { return }
                
                if err != nil {
                    authErrorMessage = err!.localizedDescription
                }
                
                else if let res  {
                    currentUser = res.user
                }
            }
        }
        
    }
    
    func setCurrentUser(){
        if auth.currentUser != nil {
            currentUser = auth.currentUser
        }
    }
    
    func signUpWithCredentials(email : String,password : String){
        if (validator.validateEmail(email) && validator.validatePassword(password)) {
            
            auth.createUser(withEmail: email, password: password) { [weak self] res, err in
                
                guard let self else { return }
                
                if err != nil {
                    authErrorMessage = err!.localizedDescription
                }
                
                else if let res  {
                    currentUser = res.user
                }
            }
        }
    }
    
    func signOut(){
        do {
            try auth.signOut()
        }catch {
            print(error.localizedDescription)
        }
    }
}



