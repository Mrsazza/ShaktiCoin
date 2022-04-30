//
//  PinCodeView.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct PinCodeView: View {
    @State private var string = ""
    @State private var forgotPassword = false
    
    var body: some View {
        ZStack{
            BackgroundView(imageName: "WelcomeBG")
            VStack{
                Spacer()
                Image("Logo1")
                    .resizable()
                    .frame(width: 200, height: 150, alignment: .center)
                    .padding()
                Spacer()
                HStack {
                    Text("Please Enter your")
                    Button(action: {
                        forgotPassword.toggle()
                    }, label: {
                        Text("PIN")
                            .underline()
                    })
                }
                .foregroundColor(.white)
                
                .padding()
                HStack{
                    if string.isEmpty{
                        Text("")
                            .padding(.all,5)
                    } else{
                        ForEach ((0..<string.count), id: \.self){_ in
                            Image(systemName: "circle.fill")
                                .foregroundColor(.white)
                                .padding(.all,5)
                        }
                    }
                }

                KeyPad(string: $string)
                    .padding(.all,40)
                Spacer()
            }
            .disabled(forgotPassword ? true : false)
            if forgotPassword{
                ZStack {
                    Rectangle()
                        .opacity(0.4)
                    VStack(spacing: 0){
                        Spacer()
                        ZStack{
                            Rectangle()
                                    .foregroundColor(Color(.systemGray4))
                            HStack{
                                Image(systemName: "ellipsis.circle.fill")
                                    .foregroundColor(.black)
                                    .font(.title)
                                Text("Forgot PIN")
                                Text("*")
                                    .font(.system(size: 12))
                                    .padding(.all,-8)
                                Text("?")
                                    .padding(.horizontal,-8)
                                Spacer()
                                VStack{
                                    Button(action: {
                                        forgotPassword.toggle()
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .padding(.vertical)
                                            .foregroundColor(.gray)
                                    })
                                   
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame( height: 80)
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                            VStack{
                                Text("We will help you to re-set your PIN. Please consider the following")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .padding(.top)
                                    .foregroundColor(.black)
                                    .opacity(0.68)
                                
                                Text("*4 to 6 digits linked to something that you own, or a memorable experience from a unique situation or numbers associated with your loved ones.")
                                    .multilineTextAlignment(.leading)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                                Spacer()
                                
                                Button(action: {
                                    //
                                }, label: {
                                    Text("Forgot Pin?")
                                })
                                .buttonStyle(PrimaryButtonStyle())
                                .padding()
                            }
                        }
                        .frame(height: 410)
                        Spacer()
                        
                       
                    }
                    .padding(.horizontal,30)
                }
                
            }
        }
    }
}

struct PinCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PinCodeView()
    }
}
