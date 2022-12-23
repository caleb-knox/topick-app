//
//  CurrentUserManager.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/25/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserManager: ObservableObject {
    
    private var id = ""
    private var firstName = ""
    private var lastName = ""
    private var birthday = Date.now
    private var accountCreationDate = Date.now
    private var rating = 0.00
    private var moneyEarned = 0.00
    private var preferredWorkDistance = 5
    private var jobsCompleted = 0
    private var jobsCreated = 0
    
    @Published var currentUser = User(id: "", firstName: "", lastName: "", birthday: Date.now, accountCreation: Date.now, rating: 0.00, moneyEarned: 0.00, preferredWorkDistance: 5, jobsCompleted: 0, jobsCreated: 0)
    
    let db = Firestore.firestore()
    
    private let currentUserID = Auth.auth().currentUser!.uid
    
    static func getOtherUserInformation(fromUserID: String, completion: @escaping (User) -> Void) {
        let db = Firestore.firestore()
        var returnUser = User(id: "", firstName: "", lastName: "", birthday: Date.now, accountCreation: Date.now, rating: 0, moneyEarned: 0, preferredWorkDistance: 5, jobsCompleted: 0, jobsCreated: 0)
        DispatchQueue.main.async {
            db.collection("users").document(fromUserID).collection("userInfo").document("profileInfo").getDocument { documentSnapshot, error in
            if documentSnapshot != nil && error == nil {
                returnUser.rating = documentSnapshot?.get("rating") as! Double
                returnUser.moneyEarned = documentSnapshot?.get("moneyEarned") as! Double
                returnUser.preferredWorkDistance = documentSnapshot?.get("preferredWorkDistance") as! Int
                returnUser.jobsCompleted = documentSnapshot?.get("jobsCompleted") as! Int
                returnUser.jobsCreated = documentSnapshot?.get("jobsCreated") as! Int
            }
            }}
            DispatchQueue.main.async {
            db.collection("users").document(fromUserID).collection("userInfo").document("basicInfo").getDocument { documentSnapshot, error in
            if documentSnapshot != nil && error == nil {
                returnUser.id = fromUserID
                returnUser.firstName = documentSnapshot?.get("firstName") as! String
                returnUser.lastName = documentSnapshot?.get("lastName") as! String
                returnUser.birthday = documentSnapshot?.get("age") as? Date ?? Date.now
                returnUser.accountCreation = documentSnapshot?.get("accountCreationDate") as? Date ?? Date.now
                print(returnUser)
                completion(returnUser)
                
            }
        }
        }
        
    }
    
    func getProfileInfo() {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("profileInfo").getDocument { documentSnapshot, error in
            if documentSnapshot != nil && error == nil {
                self.rating = documentSnapshot?.get("rating") as! Double
                self.moneyEarned = documentSnapshot?.get("moneyEarned") as! Double
                self.preferredWorkDistance = documentSnapshot?.get("preferredWorkDistance") as! Int
                self.jobsCompleted = documentSnapshot?.get("jobsCompleted") as! Int
                self.jobsCreated = documentSnapshot?.get("jobsCreated") as! Int
                self.currentUser.rating = self.rating
                self.currentUser.moneyEarned = self.moneyEarned
                self.currentUser.preferredWorkDistance = self.preferredWorkDistance
                self.currentUser.jobsCompleted = self.jobsCompleted
                self.currentUser.jobsCreated = self.jobsCreated
            }
        }
        }
    }
    
    func setProfileInfo() {
        db.collection("users").document(currentUserID).collection("userInfo").document("profileInfo").setData([
            "rating":0.00,
            "moneyEarned":0.00,
            "preferredWorkDistance":5,
            "jobsCompleted":0,
            "jobsCreated":0
        ])
    }
    
    func getBasicInfo() {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("basicInfo").getDocument { documentSnapshot, error in
            if documentSnapshot != nil && error == nil {
                self.id = self.currentUserID
                self.firstName = documentSnapshot?.get("firstName") as! String
                self.lastName = documentSnapshot?.get("lastName") as! String
                self.birthday = documentSnapshot?.get("age") as? Date ?? Date.now
                self.accountCreationDate = documentSnapshot?.get("accountCreationDate") as? Date ?? Date.now
                self.currentUser.id = self.id
                self.currentUser.firstName = self.firstName
                self.currentUser.lastName = self.lastName
                self.currentUser.birthday = self.birthday
                self.currentUser.accountCreation = self.accountCreationDate
                
            }
        }
        }
    }
    
    func storeBasicInfo(firstName: String, lastName: String, birthday: Date) {
        db.collection("users").document(currentUserID).collection("userInfo").document("basicInfo").setData([
            "firstName":firstName,
            "lastName":lastName,
            "birthday":birthday,
            "accountCreationDate":Date.now
        ])
    }
    
    func updateFirstName(firstName: String) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("basicInfo").updateData([
                "firstName":firstName
            ])
            self.currentUser.firstName = firstName
        }
    }
    
    func updateLastName(lastName: String) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("basicInfo").updateData([
                "lastName":lastName
            ])
            self.currentUser.lastName = lastName
        }
    }
    
    func updateRating(rating: Double) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("profileInfo").updateData([
                "rating":rating
            ])
            self.currentUser.rating = rating
        }
    }
    
    func updateJobsCompleted(jobsCompleted: Int) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("profileInfo").updateData([
                "jobsCompleted":jobsCompleted
            ])
            self.currentUser.jobsCompleted = jobsCompleted
        }
    }
    
    func updateJobsCreated(jobsCreated: Int) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("profileInfo").updateData([
                "jobsCreated":jobsCreated
            ])
            self.currentUser.jobsCreated = jobsCreated
        }
    }
    
    func updateMoneyEarned(moneyEarned: Double) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("profileInfo").updateData([
                "moneyEarned":moneyEarned
            ])
            self.currentUser.moneyEarned = moneyEarned
        }
    }
    
    func updatePreferredWorkDistance(preferredWorkDistance: Int) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("userInfo").document("profileInfo").updateData([
                "preferredWorkDistance":preferredWorkDistance
            ])
            self.currentUser.preferredWorkDistance = preferredWorkDistance
        }
    }
    
    
}
