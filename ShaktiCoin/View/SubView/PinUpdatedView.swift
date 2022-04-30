//
//  PinUpdatedView.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct PinUpdatedView: View {
    var body: some View {
        ZStack{
            BackgroundView(imageName: "LoginBG")
            VStack{
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(.white)
                    .padding()
                Text("Your PIN has been Updated!")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.thin)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Go to my Wallet")
                })
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding()
        }
    }
}

struct PinUpdatedView_Previews: PreviewProvider {
    static var previews: some View {
        PinUpdatedView()
    }
}
