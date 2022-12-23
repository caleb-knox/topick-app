//
//  LoginManager.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/24/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginManager: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    let db = Firestore.firestore()
    
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            self.signedIn = true
        }
        
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            self.db.collection("users").document(result!.user.uid).setData([
                "id":result!.user.uid
            ])
            self.signedIn = true
        }
    }
    
    func reset() {
        signedIn = false
        logout()
    }
    
    func logout() {
        do {
            try auth.signOut()
        } catch {
            print("already logged out")
            
        }
    }
}

