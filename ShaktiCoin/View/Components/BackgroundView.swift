//
//  BackgroundView.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct BackgroundView: View {
    @State var imageName:String
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
//                .scaledToFill()
//                .padding()
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(imageName: "WelcomeBG")
    }
}
