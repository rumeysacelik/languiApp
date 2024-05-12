//
//  LoginScreen.swift
//  langui
//
//  Created by Mehmet Emin Ak on 11.05.2024.
//

import SwiftUI

struct LoginOrRegisterView : View {
    
    var body: some View {
        VStack {
            
            Image("login")
                    .resizable()
                    .frame(width: Constants.screenWidth,height: Constants.screenHeight * 0.45)
                    .padding(.top,50)
                    .contentMargins(10)
                    
            Spacer()
            VStack {
                
                Text("Learn to local changes for free!")
                    .padding(.top,Constants.screenHeight * 0.05)
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(width: Constants.screenWidth)
                    .multilineTextAlignment(.center)
                
                Text("Learn all languages interactively at your finger tips!")
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .frame(width: Constants.screenWidth * 0.7)
                    .multilineTextAlignment(.center)
                    .padding(.top,30)
                HStack {
                    Spacer()
                    Button("Register"){
                        
                    }
                    .foregroundStyle(.white)
                    .frame(width: Constants.screenWidth * 0.3,height: 20)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white,lineWidth: 3)
                    )
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .overlay {
                                Text("Login")
                                    .foregroundStyle(Color(uiColor: UIColor(hex: Constants.mainColor)))
                            }
                            .frame(width: Constants.screenWidth * 0.4,height: 53)
                    })
                    Spacer()
                }
                .padding(.top,80)
                Spacer()
                
            }
            .frame(width: Constants.screenWidth,
                   height: Constants.screenHeight * 0.55)
            .background(Color(uiColor: UIColor(hex: "CCADF7")))
            .clipShape(
                .rect(topLeadingRadius: Constants.screenWidth * 0.05,
                      topTrailingRadius: Constants.screenWidth * 0.05))
        }
    }
}

#Preview {
    LoginOrRegisterView()
}

