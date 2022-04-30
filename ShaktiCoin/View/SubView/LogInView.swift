//
//  LogInView.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    @State var remember = false
    
    var body: some View {
        ZStack{
            BackgroundView(imageName: "LoginBG")
            VStack{
                LogoTop()
                Spacer()
                VStack{
                    Text("Please Enter your Password to Sign In")
                        .foregroundColor(.white)
                        .padding(.bottom)
                    HStack{
                        Text("Email Address")
                            .foregroundColor(Color("goldenLight"))
                        Spacer()
                    }.padding(.leading)
                    //.padding(.top)
                    .padding(.bottom,-6)
                    TextField("", text: $email)
                        .placeholder(when: email.isEmpty) {
                            Text("Email").foregroundColor(.gray)
                        }
                        .modifier(RectangleTextFieldStyle())
                    
                    TextField("", text: $password)
                        .keyboardType(.numberPad)
                        .placeholder(when: password.isEmpty) {
                            Text("Password").foregroundColor(.white)
                        }
                        .modifier(RectangleTextFieldStyle())
                        .padding(.vertical)
                    HStack{
                        Button(action: {
                            remember.toggle()
                        }, label: {
                            HStack{
                                Image(systemName: remember ? "square.fill" : "square")
                                    .foregroundColor(.white)
                                Text("Remember Me")
                                    .foregroundColor(.white)
                            }
                        })
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .foregroundColor(.white)
                                .underline()
                        })
                    }
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Sign In")
                    })
                    .buttonStyle(PrimaryButtonStyle())
                }.padding()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
