//
//  KeyPadButton.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct KeyPadButton: View {
    var key: String = ""
    
    var body: some View {
        Button(action: { self.action(self.key) }) {
            if key == "delete.left"{
                Image(systemName: "\(key)")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .semibold))
                    .padding()
            } else if key == "square.and.arrow.up"{
                Image(systemName: "\(key)")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .semibold))
                    .rotationEffect(.degrees(90))
                    .padding()
            } else{
            Circle()
                .foregroundColor(.gray)
                .opacity(0.7)
                .overlay(
                    Text(key)
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .thin))
                )
                .frame(width: 60, height: 60)
                .padding(.horizontal)
                .padding(.vertical,10)
            }
        }
        
    }
    
    enum ActionKey: EnvironmentKey {
        static var defaultValue: (String) -> Void { { _ in } }
    }
    
    @Environment(\.keyPadButtonAction) var action: (String) -> Void
    
}

struct KeyPadButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadButton(key: "8")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
