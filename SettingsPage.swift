//
//  SettingsPage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct SettingsPage: View {
    
    @State var isSettingsPageShowing: Bool
    
    @ObservedObject var userManager: UserManager
    @ObservedObject var imagesManager: ImageManager
    
    var body: some View {
        
        if isSettingsPageShowing {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        isSettingsPageShowing.toggle()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .foregroundColor(.mint)
                    }.offset(x: -120)
                    
                    Text("Settings")
                        .font(.title2)
                        .offset(x: -10)
                    
                }.padding(.top, 20)
                
                List {
                    Button(action: {
                        
                    }) {
                        HStack {
                            Text("About us")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                            Image(systemName: "chevron.right")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                        }
                    }
                }
            }
        } else {
            ProfilePage(isProfileCommentsSheetShowing: false, workDistance: 5, isProfilePageShowing: true, userManager: userManager, imagesManager: imagesManager)
        }
    }
}
