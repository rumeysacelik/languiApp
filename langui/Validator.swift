//
//  Validator.swift
//  langui
//
//  Created by Mehmet Emin Ak on 24.05.2024.
//

import Foundation


final class Validator {
   
    func validateEmail(_ email : String) -> Bool {
    
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        print(emailPredicate.evaluate(with: email))
        return emailPredicate.evaluate(with: email)
    }
    
    func validatePassword(_ password : String) -> Bool {
        print(password.count)
        return password.count >= 6 ? true : false
    }
}
