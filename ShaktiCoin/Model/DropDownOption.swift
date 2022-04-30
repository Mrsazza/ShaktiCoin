//
//  DropDownOption.swift
//  ShaktiCoin
//
//  Created by Sazza on 30/4/22.
//

import Foundation

struct DropdownOption: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}
