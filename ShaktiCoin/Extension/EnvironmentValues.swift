//
//  EnvironmentValues.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import Foundation
import SwiftUI

extension EnvironmentValues {
    var keyPadButtonAction: (String) -> Void {
        get { self[KeyPadButton.ActionKey.self] }
        set { self[KeyPadButton.ActionKey.self] = newValue }
    }
}
