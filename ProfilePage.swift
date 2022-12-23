//
//  ProfilePage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct ProfilePage: View {
    
    @State var isProfileCommentsSheetShowing: Bool
    @State var workDistance: Int
    @State var isProfilePageShowing: Bool
    
    @ObservedObject var userManager: UserManager
    @ObservedObject var imagesManager: ImageManager
    
    var body: some View {
        if isProfilePageShowing {
            VStack(spacing: 20) {
                VStack {
                    HStack {
                        Spacer().frame(width: 310)
                        Button(action: {
                            isProfilePageShowing.toggle()
                        }) {
                            Image(systemName: "gear")
                                .font(.system(size: 20))
                                .foregroundColor(.black).opacity(0.7)
                        }.offset(y: 40)
                    }
                    HStack(spacing: 20) {
                        if imagesManager.selectedImage != nil {
                        Image(uiImage: imagesManager.selectedImage!)
                            .resizable()
                            .frame(width: 175, height: 200)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                        } else {
                            Circle()
                                .frame(width: 175, height: 200)
                                .foregroundColor(.blue).opacity(0.4)
                                .shadow(radius: 4)
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(userManager.currentUser.firstName) \(userManager.currentUser.lastName)" )
                                .font(.title3)
                            HStack {
                                Image(systemName: "mappin.circle")
                                    .font(.subheadline)
                                    .opacity(0.6)
                                
                                
                                Text("Burlington, VT")
                                    .font(.headline)
                                    .fontWeight(.light)
                                    .opacity(0.7)
                            }
                        }
                    }
                }
                Button(action: {
                    
                }) {
                    
                    Text("Edit Profile")
                        .foregroundColor(.cyan)
                    
                    Spacer().frame(width: 150)
                    
                    
                }
                VStack(spacing: 20) {
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.mint)
                    VStack(spacing: 20) {
                        HStack(spacing: 0) {
                            Text("\(userManager.currentUser.rating.formatted()) ")
                                .font(.title)
                                .foregroundColor(.orange)
                            Text("out of 5 rating")
                                .fontWeight(.light)
                                .opacity(0.7)
                                .offset(y: 3)
                        }
                    }
                    HStack(spacing: 20) {
                        
                        
                        
                        HStack(spacing: 0) {
                            Text("\(userManager.currentUser.jobsCompleted) ")
                                .font(.title)
                                .foregroundColor(.cyan)
                            Text("jobs completed")
                                .fontWeight(.light)
                                .opacity(0.7)
                                .offset(y: 3)
                        }
                        
                        HStack(spacing: 0) {
                            Text("\(userManager.currentUser.jobsCreated) ")
                                .font(.title)
                                .foregroundColor(.green)
                            Text("jobs created")
                                .fontWeight(.light)
                                .opacity(0.7)
                                .offset(y: 3)
                        }
                    }
                    Button(action: {
                        isProfileCommentsSheetShowing.toggle()
                    }) {
                        Text("Comments")
                            .font(.headline)
                            .foregroundColor(.cyan)
                            .underline()
                    }.sheet(isPresented: $isProfileCommentsSheetShowing, onDismiss: nil) {
                        VStack {
                            HStack {
                                Button(action: {
                                    isProfileCommentsSheetShowing.toggle()
                                }) {
                                    Text("Back to Profile")
                                        .foregroundColor(.mint)
                                    
                                        .padding(20)
                                }
                                Spacer()
                            }
                            Spacer()
                            Text("")
                        }
                        
                    }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.mint)
                }
                
                HStack(spacing: 20) {
                    VStack {
                        Text("Work Distance")
                            .font(.headline)
                            .foregroundColor(.gray)
                            
                        Button(action: {
                            workDistance = 5
                            userManager.updatePreferredWorkDistance(preferredWorkDistance: 5)
                        }) {
                            if workDistance == 5 {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 50)
                                        .foregroundColor(.mint)
                                        .shadow(radius: 3)
                                    Text("5 miles")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 50)
                                        .foregroundColor(.white)
                                        .shadow(radius: 3)
                                    Text("5 miles")
                                        .font(.headline)
                                        .foregroundColor(.mint)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        Button(action: {
                            workDistance = 10
                            userManager.updatePreferredWorkDistance(preferredWorkDistance: 10)
                        }) {
                            if workDistance == 10 {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 50)
                                        .foregroundColor(.mint)
                                        .shadow(radius: 3)
                                    Text("10 miles")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 50)
                                        .foregroundColor(.white)
                                        .shadow(radius: 3)
                                    Text("10 miles")
                                        .font(.headline)
                                        .foregroundColor(.mint)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        Button(action: {
                            workDistance = 25
                            userManager.updatePreferredWorkDistance(preferredWorkDistance: 25)
                        }) {
                            if workDistance == 25 {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 50)
                                        .foregroundColor(.mint)
                                        .shadow(radius: 3)
                                    Text("25 miles")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 50)
                                        .foregroundColor(.white)
                                        .shadow(radius: 3)
                                    Text("25 miles")
                                        .font(.headline)
                                        .foregroundColor(.mint)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                    VStack {
                        Text("Money Earned")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 131)
                                .foregroundColor(.white)
                                .shadow(radius: 7)
                                .padding()
                            Text("$\(userManager.currentUser.moneyEarned.formatted())")
                                .font(.title2)
                                .foregroundColor(.orange)
                                .fontWeight(.bold)
                        }
                    }
                }.padding()
                
                
            }.padding(.top, 20).onAppear {
                workDistance = userManager.currentUser.preferredWorkDistance
            }
        } else {
            SettingsPage(isSettingsPageShowing: true, userManager: userManager, imagesManager: imagesManager)
        }
    }
}
