//
//  PrimaryButtonStyle.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(
                Rectangle()
                    .fill(
                         LinearGradient(gradient: Gradient(colors: [Color("goldenDark"), Color("goldenLight")]), startPoint: .leading, endPoint: .trailing)
                         )
            )
    }
}
