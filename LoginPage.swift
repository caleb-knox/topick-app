//
//  LoginPage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct LoginPage: View {
    
    
    @State var email: String
    @State var password: String
    
    @Binding var isLoginPageShowing: Bool
    
    @ObservedObject var loginManager: LoginManager
    
    var body: some View {
            VStack(spacing: 20) {
                // Title
                VStack {
                    Text("Topick")
                        .font(.system(size: 40))
                        .fontWeight(.light)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(3)
                    Text("The place where no job is too small")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
                //Background for login info
                ZStack {
                    RoundedRectangle(cornerRadius: 31)
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: 401, maxHeight: 401)
                        .shadow(radius: 6)
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 400, maxHeight: 400)
                    
                    VStack(spacing: 20) {
                        
                        Text("Login")
                            .font(.title)
                            .foregroundColor(.gray)
                        
                        //Email Field
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .foregroundColor(.gray)
                                .frame(width: 321, height: 51)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: 320, height: 50)
                            
                            TextField("Email", text: $email)
                                .frame(maxWidth: 300)
                                .padding()
                            
                        }
                        
                        //Password Field
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .foregroundColor(.gray)
                                .frame(width: 321, height: 51)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: 320, height: 50)
                            HStack {
                                SecureField("Password", text: $password)
                                    .frame(maxWidth: 300)
                                    
                                
                            }
                        }
                        
                        Button(action: {
                            loginManager.signIn(email: email, password: password)
                        }) {
                            ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 50)
                                    .foregroundColor(.mint)
                                    .shadow(radius: 4)
                            Text("Sign In")
                                .foregroundColor(.white)
                                .font(.headline)
                            }
                        }
                        
                        // Switch to create account view
                        HStack {
                            Text("Don't have an account yet?")
                                .foregroundColor(.gray)
                            Button(action: {
                                isLoginPageShowing.toggle()
                            }) {
                                Text("Sign up")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .underline()
                            }
                            
                        }
                        
                    }
                    
                }
                
                // Bottom badges that example work
                HStack(spacing: 20) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .frame(width: 101, height: 101)
                                .foregroundColor(.gray)
                                
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .shadow(radius: 1)
                            Image(systemName: "pencil")
                                .foregroundColor(Color.mint)
                                .font(.system(size: 40))
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .frame(width: 101, height: 101)
                                .foregroundColor(.gray)
                                
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .shadow(radius: 1)
                            Image(systemName: "cart.fill")
                                .foregroundColor(Color("PrimaryColor"))
                                .font(.system(size: 40))
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .frame(width: 101, height: 101)
                                .foregroundColor(.gray)
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .shadow(radius: 1)
                            Image(systemName: "hammer.fill")
                                .foregroundColor(Color.cyan)
                                .font(.system(size: 40))
                        }
                        
                    }
        }
    }
}
