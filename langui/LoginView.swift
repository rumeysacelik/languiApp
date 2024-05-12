//
//  LoginView.swift
//  langui
//
//  Created by Mehmet Emin Ak on 12.05.2024.
//

import SwiftUI

struct LoginView : View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var isPasswordShowing : Bool = false
    @State var isAlertPresented : Bool = false
    @State var alertInfo : AlertInfos?
    func isEmailValid() -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isPasswordValid() -> Bool {
        return password.count > 6 ? true : false
    }
    
    var body: some View {
        ScrollView {
            VStack{
                Image("login")
                    .resizable()
                    .frame(width: Constants.screenWidth,height: Constants.screenHeight * 0.45)
                    .contentMargins(10)
                
                VStack(alignment: .leading) {
                    Text("Input Your Email")
                        .padding(.leading,5)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(uiColor: UIColor(hex: Constants.mainColor)))
                    
                    TextField("Your email address", text: $email)
                        .frame(width: Constants.screenWidth * 0.7, height: 15)
                        .padding(20)
                        .overlay {
                            Capsule()
                                .stroke(lineWidth: 1)
                                .fill(Color(uiColor: UIColor(hex: Constants.mainColor)))
                            
                            
                        }
                    
                    Text("Input Your Password")
                        .padding(.leading,5)
                        .padding(.top,20)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(uiColor: UIColor(hex: Constants.mainColor)))
                    HStack {
                    
                        if !isPasswordShowing {
                            SecureField("Your password", text: $password)
                                .frame(width: Constants.screenWidth * 0.7, height: 15)
                                .padding(20)
                                
                                .overlay {
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                        .fill(Color(uiColor: UIColor(hex: Constants.mainColor)))
                                    
                                    Button(action: {
                                        isPasswordShowing.toggle()
                                    }, label: {
                                        Image("eye.close")
                                            .resizable()
                                            .frame(width: 25,height: 30)
                                    })
                                    .padding(.leading,Constants.screenWidth * 0.65)
                            }
                        }else {
                            TextField("Your password", text: $password)
                                .frame(width: Constants.screenWidth * 0.7, height: 15)
                                .padding(20)
                                
                                .overlay {
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                        .fill(Color(uiColor: UIColor(hex: Constants.mainColor)))
                                    
                                    Button(action: {
                                        isPasswordShowing.toggle()
                                    }, label: {
                                        Image("eye.open")
                                            .resizable()
                                            .frame(width: 25,height: 30)
                                    })
                                    .padding(.leading,Constants.screenWidth * 0.65)
                            }
                        }
                    }
                }
                
                Button(action: {
                    if !isEmailValid() {
                        alertInfo = AlertInfos(alertTitle: "Hata!".localized(),alertMessage: "Lütfen geçerli bir mail adresi giriniz".localized())
                        isAlertPresented = true
                        
                        }else if !isPasswordValid() {
                            
                        alertInfo = AlertInfos(alertTitle: "Hata!".localized(),alertMessage: "Şifreniz en az 6 karakterli olmalıdır".localized())
                            isAlertPresented = true
                    }
                }, label: {
                    Capsule()
                        .fill(Color(uiColor: UIColor(hex: Constants.mainColor)))
                        .frame(width: Constants.screenWidth * 0.8,height: 57)
                        .overlay {
                            Text("Login")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
            
                        }
                        .padding(.top,20)
                })
                
                HStack {
                    Text("Doesn't have account?")
                        .foregroundStyle(.gray)
                    Text("Register")
                        .foregroundStyle(Color(uiColor: UIColor(hex: Constants.mainColor)))
                }
                .padding(.top,20)
                .padding(.bottom,120)
                
            
            }
        }
        .onTapGesture {
            
        }
    }
}

struct AlertInfos {
    var alertTitle : String = "Hata!"
    var alertMessage : String?
}

#Preview {
    LoginView()
}
