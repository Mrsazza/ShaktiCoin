//
//  SignUpView.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var verificationCode = ""
    @State var pin = ""
    @State var mobileNumber = ""
    @State var count = 0
    var body: some View {
        ZStack{
            BackgroundView(imageName: "SignUpBG")
            VStack{
                LogoTop()
                Spacer()
                if count == 0{
                    MailView(email: $email, count: $count)
                } else if count == 1{
                    VerificationView(verificationCode: $verificationCode, count: $count)
                } else if count == 2{
                    MobileNumberView(mobileNumber: $mobileNumber, count: $count)
                } else if count == 3 {
                    VerificationView(verificationCode: $verificationCode, count: $count, isMail: false)
                } else {
                    NewPinView(pin: $pin, count: $count)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct MailView: View {
    @Binding var email: String
    @Binding var count: Int
    var body: some View {
        VStack{
            Spacer()
            TextField("", text: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .placeholder(when: email.isEmpty) {
                    Text("Enter Email Address").foregroundColor(.white)
                }
                .modifier(RectangleTextFieldStyle())
            Spacer()
            Button(action: {
                count += 1
            }, label: {
                Text("Continue")
            }).buttonStyle(PrimaryButtonStyle())
        }
        .padding()
    }
}

struct VerificationView: View {
    @Binding var verificationCode:String
    @Binding var count:Int
    @State var isMail = true
    var body: some View {
        VStack{
            Spacer()
            Text("Thank You!")
                .foregroundColor(.white)
            Text("Enter the Verification code sent to your \(isMail ? "Email" : "SMS")")
                .foregroundColor(.white)
            TextField("", text: $verificationCode)
                .keyboardType(.numberPad)
                .placeholder(when: verificationCode.isEmpty) {
                    Text("\(isMail ? "Email" : "SMS") Verification Code").foregroundColor(.white)
                }
                .modifier(RectangleTextFieldStyle())
                .padding(.top)
            Button(action: {
                count += 1
            }, label: {
                Text("Continue")
            })
            .padding(.vertical)
            .buttonStyle(PrimaryButtonStyle())
            Button(action: {
                //
            }, label: {
                Text("Resend \(isMail ? "Email" : "SMS") Verfication code in 90s")
                    .foregroundColor(.white)
                    .underline()
            })
            Spacer()
            Button(action: {
                count -= 1
            }, label: {
                Text("Let me go back and correct something")
                    .foregroundColor(.white)
                    .underline()
            })
        }
        .padding()
    }
}

struct MobileNumberView: View {
    
    @Binding var mobileNumber:String
    @Binding var count:Int
    var options: [DropdownOption] = dropDownList
    
    var body: some View {
        VStack{
            Spacer()
            Text("Email confirmed!")
                .foregroundColor(.white)
            Text("Enter Mobile Number to continue")
                .foregroundColor(.white)
            Text("We will send you an SMS with a Verification code.")
                .foregroundColor(Color(.systemGray3))
            
            // TODO: - STEPPER
            DropdownSelector(
                placeholder: "Select Country Code",
                options: options,
                onOptionSelected: { option in
                    print(option)
            })
            .zIndex(1)
            
            TextField("", text: $mobileNumber)
                .keyboardType(.numberPad)
                .placeholder(when: mobileNumber.isEmpty) {
                    Text("Mobile Number").foregroundColor(.white)
                }
                .modifier(RectangleTextFieldStyle())
                .padding(.top)
            Button(action: {
                count += 1
            }, label: {
                Text("Continue")
            })
            .buttonStyle(PrimaryButtonStyle())
            .padding(.vertical)
            Spacer()
            Button(action: {
                count -= 1
            }, label: {
                Text("Let me go back and correct something")
                    .foregroundColor(.white)
                    .underline()
            })
        }
        .padding()
    }
}

struct NewPinView: View {
    @Binding var pin: String
    @Binding var count: Int
    @State var hint = ""
    var body: some View {
        VStack{
            Spacer()
            Text("Enter your new PIN*")
                .foregroundColor(.white)
            
            TextField("", text: $pin)
                .keyboardType(.numberPad)
                .placeholder(when: pin.isEmpty) {
                    Text("Enter your new PIN").foregroundColor(.white)
                }
                .modifier(RectangleTextFieldStyle())
                .padding(.top,10)
            
            TextField("", text: $pin)
                .keyboardType(.numberPad)
                .placeholder(when: pin.isEmpty) {
                    Text("Re-enter your new PIN").foregroundColor(.white)
                }
                .modifier(RectangleTextFieldStyle())
                .padding(.top,10)
            
            HStack{
                Text("Hint*")
                    .foregroundColor(Color("goldenLight"))
                Spacer()
            }.padding(.leading)
            //.padding(.top)
            .padding(.bottom,-6)
            SecureInputView("Hint",text: $hint)
            
            Text("*4 to 6 digits linked to something that you own, or a memorable experience from a unique situation or numbers associated with your loved ones.")
                .foregroundColor(.white)
                .font(.footnote)
                .padding(.vertical)
            Button(action: {
                //count += 1
            }, label: {
                Text("Continue")
            }).buttonStyle(PrimaryButtonStyle())
            
            Spacer()
            Button(action: {
                count -= 1
            }, label: {
                Text("Let me go back and correct something")
                    .foregroundColor(.white)
                    .underline()
            })
        }.padding()
    }
}


struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
                if isSecured {
                    SecureField("", text: $text)
                        .placeholder(when: text.isEmpty) {
                            Text("********").foregroundColor(.white)
                        }
                        .modifier(RectangleTextFieldStyle())
                } else {
                    TextField("", text: $text)
                        .placeholder(when: text.isEmpty) {
                            Text("Enter Hint").foregroundColor(.white)
                        }
                        .modifier(RectangleTextFieldStyle())
                }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.white)
            }
            .padding()
        }
    }
}
