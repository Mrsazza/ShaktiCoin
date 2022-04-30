//
//  KeyPad.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct KeyPad: View {
    @Binding var string: String
    
    var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: ["delete.left", "0", "square.and.arrow.up"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
    }
    
    private func keyWasPressed(_ key: String) {
        switch key {
        ///Add case for Next View / Arrow button
        // case "square.and.arrow.up":
        case "delete.left":
            string.removeLast()
        default: if string.count < 6 {string += key}
        }
    }
}

//struct KeyPad_Previews: PreviewProvider {
//    static var previews: some View {
//        KeyPad()
//    }
//}
