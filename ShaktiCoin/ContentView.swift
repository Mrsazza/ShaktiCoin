//
//  ContentView.swift
//  ShaktiCoin
//
//  Created by Sazza on 29/4/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        /// Pin Code View
        // PinCodeView()
        
        /// Sign Up View
        SignUpView()
        
        ///Log in View
        //LogInView()
        
        /// Pin Updated View
//        PinUpdatedView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone 8")
        }
    }
}
