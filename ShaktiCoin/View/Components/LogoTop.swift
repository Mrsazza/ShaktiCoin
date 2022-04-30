//
//  LogoTop.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct LogoTop: View {
    var body: some View {
        VStack(spacing:0){
            Image("Logo")
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .padding()
            Text("Welcome to Shakti World")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .light))
            Text("The Next-Gen DeFi Network")
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct LogoTop_Previews: PreviewProvider {
    static var previews: some View {
        LogoTop()
    }
}
