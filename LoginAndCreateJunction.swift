//
//  LoginAndCreateJunction.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/25/22.
//

import SwiftUI

struct LoginAndCreateJunction: View {
    
    @State var isLoginPageShowing = true
    @State var hasProfileBeenCreated = false
    
    @ObservedObject var loginManager: LoginManager
    
    
    var body: some View {
        
        if !loginManager.signedIn {
            if isLoginPageShowing {
                LoginPage(email: "", password: "", isLoginPageShowing: $isLoginPageShowing, loginManager: loginManager)
            } else {
                CreateAccountPage(email: "", password: "", confirmPassword: "", isLoginPageShowing: $isLoginPageShowing, loginManager: loginManager)
            }
        } else {
            let userManager = UserManager()
            let imagesManager = ImageManager()
            let jobsManager = JobsManager()
            if isLoginPageShowing {
                MainPageNavigation(tabSelection: 1, userManager: userManager, imagesManager: imagesManager, jobsManager: jobsManager).onAppear {
                    jobsManager.update()
                    userManager.getBasicInfo()
                    userManager.getProfileInfo()
                    imagesManager.retrievePhotos()
                }
            } else {
                if !hasProfileBeenCreated {
                    ProfileCreationPage(firstName: "", lastName: "", isImagePickerShowing: false, hasProfileBeenCreated: $hasProfileBeenCreated, userManager: userManager, imageManager: imagesManager)
                } else {
                    MainPageNavigation(tabSelection: 1, userManager: userManager, imagesManager: imagesManager, jobsManager: jobsManager).onAppear {
                        userManager.getBasicInfo()
                        userManager.getProfileInfo()
                    }
                }
            }
        }
    }
}

