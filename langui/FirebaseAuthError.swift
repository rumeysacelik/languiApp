//
//  FirebaseAuthError.swift
//  langui
//
//  Created by Mehmet Emin Ak on 24.05.2024.
//


import Foundation
import FirebaseAuth

enum FirebaseAuthError: Error {
    case networkError
    case userNotFound
    case userDisabled
    case invalidEmail
    case wrongPassword
    case emailAlreadyInUse
    case weakPassword
    case unknownError
    case customError(String)

    var localizedDescription: String {
        switch self {
        case .networkError:
            return "Network error. Please try again.".localized()
        case .userNotFound:
            return "User not found. Please check your email.".localized()
        case .userDisabled:
            return "User account has been disabled.".localized()
        case .invalidEmail:
            return "Invalid email address.".localized()
        case .wrongPassword:
            return "Incorrect password. Please try again.".localized()
        case .emailAlreadyInUse:
            return "The email address is already in use.".localized()
        case .weakPassword:
            return "The password is too weak. Please choose a stronger password.".localized()
        case .unknownError:
            return "An unknown error occurred. Please try again.".localized()
        case .customError(let message):
            return message
        }
    }

    init(error: Error) {
        if let authError = error as? NSError, let errorCode = AuthErrorCode.Code(rawValue: authError.code) {
            switch errorCode {
            case .networkError:
                self = .networkError
            case .userNotFound:
                self = .userNotFound
            case .userDisabled:
                self = .userDisabled
            case .invalidEmail:
                self = .invalidEmail
            case .wrongPassword:
                self = .wrongPassword
            case .emailAlreadyInUse:
                self = .emailAlreadyInUse
            case .weakPassword:
                self = .weakPassword
            default:
                self = .unknownError
            }
        } else {
            self = .unknownError
        }
    }
}

// Usage example
func convertToAuthError(_ error: Error) -> FirebaseAuthError {
    let authError = FirebaseAuthError(error: error)
    return authError
}
