//
//  ContentView.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct ContentView: View {
    
    let loginManager = LoginManager()
    
    var body: some View {
        
        LoginAndCreateJunction(loginManager: loginManager)
        
    }
}

