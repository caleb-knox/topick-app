//
//  JobsManager.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/25/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class JobsManager: ObservableObject {
    
    @Published var jobs: [Job] = []
    
    @Published var myJobsPosted: [Job] = []
    @Published var myJobsToDo: [Job] = []
    
    @Published var jobBids: [User] = []
    
    let db = Firestore.firestore()
    
    let currentUserID = Auth.auth().currentUser!.uid
    
    let serialQueue = DispatchQueue(label: "Serial Queue")
    
    func addMyJobsToDo(job: Job) {
        serialQueue.async {
            do {
                try self.db.collection("users").document(self.currentUserID).collection("myJobsToDo").document(job.id).setData(from: job)
            } catch {
                return
            }
        }
    }
    
    func update() {
        self.getMyJobsToDo()
        self.getMyJobsPosted()
    }
    
    func getMyJobsToDo() {
        serialQueue.async {
            self.db.collection("users").document(self.currentUserID).collection("myJobsToDo").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(String(describing: error))")
                    return
                }
                
                self.myJobsToDo = documents.compactMap { document -> Job? in
                    do {
                        return try document.data(as: Job.self)
                    } catch {
                        print("Error decodeing documents into match: \(error)")
                        return nil
                    }
                }
                self.getJobs()
            }
        }
    }
    
    func sendBid(createdUserID: String, jobID: String) {
        DispatchQueue.main.async {
            UserManager.getOtherUserInformation(fromUserID: self.currentUserID) { user in
                do {
                    try self.db.collection("users").document(createdUserID).collection("myJobsPosted").document(jobID).collection("bids").document(createdUserID).setData(from: user)
                } catch {
                    return
                }
            }
            
        }
    }
    
    func removeBid(bidID: String) {
        
    }
    
    func getBids(jobID: String) {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("myJobsPosted").document(jobID).collection("bids").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(String(describing: error))")
                    return
                }
                
                self.jobBids = documents.compactMap { document -> User? in
                    do {
                        return try document.data(as: User.self)
                    } catch {
                        print("Error decodeing documents into match: \(error)")
                        return nil
                    }
                }
                
            }
        }
    }
    
    func addMyJobsPosted(job: Job) {
        DispatchQueue.main.async {
            do {
                try self.db.collection("users").document(self.currentUserID).collection("myJobsPosted").document(job.id).setData(from: job)
            } catch {
                return
            }
        }
    }
    
    func getMyJobsPosted() {
        DispatchQueue.main.async {
            self.db.collection("users").document(self.currentUserID).collection("myJobsPosted").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(String(describing: error))")
                    return
                }
                
                self.myJobsPosted = documents.compactMap { document -> Job? in
                    do {
                        return try document.data(as: Job.self)
                    } catch {
                        print("Error decodeing documents into match: \(error)")
                        return nil
                    }
                }
                
            }
        }
    }
    
    func getJobs() {
        serialQueue.async {
            self.db.collection("jobs").limit(to: 10).getDocuments { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(String(describing: error))")
                    return
                }
                
                self.jobs = documents.compactMap { document -> Job? in
                    do {
                        let tempJob = try document.data(as: Job.self)
                        return document.get("createdUserID") as! String != self.currentUserID &&
                        !self.myJobsToDo.contains(tempJob)
                        ? tempJob : nil
                    } catch {
                        print("Error decodeing documents into match: \(error)")
                        return nil
                    }
                }
            }
        }
    }
    
    func addJob(timeNeededBy: Date, creatorName: String, jobTitle: String, description: String, specialRequests: String, price: Int, address: String) {
        let jobID = UUID().uuidString
        let timeCreated = Date.now
        db.collection("jobs").document(jobID).setData([
            "id":jobID,
            "createdUserID":currentUserID,
            "creatorName":creatorName,
            "jobTitle":jobTitle,
            "timeCreated":timeCreated,
            "timeNeededBy":timeNeededBy,
            "description":description,
            "specialRequests":specialRequests,
            "price":price,
            "address":address
            
        ])
        self.addMyJobsPosted(job: Job(id: jobID, createdUserID: currentUserID, creatorName: creatorName, jobTitle: jobTitle, timeCreated: timeCreated, timeNeededBy: timeNeededBy, description: description, specialRequests: specialRequests, price: price, address: address))
    }
    
    
}
