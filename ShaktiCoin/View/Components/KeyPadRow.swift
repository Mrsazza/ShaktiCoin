//
//  KeyPadRow.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import SwiftUI

struct KeyPadRow: View {
    var keys: [String]
    var body: some View {
        HStack {
            ForEach(keys, id: \.self) { key in
                KeyPadButton(key: key)
            }
        }
    }
}

struct KeyPadRow_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadRow(keys: ["delete.left","0","square.and.arrow.up"])
            .padding()
            .frame(width: 200, height: 80)
            .previewLayout(.sizeThatFits)
    }
}

