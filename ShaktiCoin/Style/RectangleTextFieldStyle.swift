//
//  RectangleTextFieldStyle.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import Foundation
import SwiftUI

struct RectangleTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .background(Color.clear)
            .padding()
            .border(Color("goldenLight"))
            //.padding()
    }
}
