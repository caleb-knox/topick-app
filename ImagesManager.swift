//
//  ImagesManager.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/25/22.
//

import Foundation
import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import UIKit

class ImageManager: ObservableObject {
    
    @Published var selectedImage: UIImage?
    
    func uploadPhoto(selectedImage: UIImage?) {
        
        guard selectedImage != nil else {
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {
            return
        }
        
        let path = "images/\(UUID()).jpg"
        let fileRef = storageRef.child(path)
        
        fileRef.putData(imageData!, metadata: nil) { metadata, error in
            if error == nil && metadata != nil {
                let db = Firestore.firestore()
                let currentUserID = Auth.auth().currentUser!.uid
                db.collection("users").document(currentUserID).collection("userInfo").document("profileImage").setData(["url":path]) { error in
                    if error == nil {
                        self.retrievePhotos()
                    }
                }
            }
        }
        
    }
    
    func retrievePhotos() {
        DispatchQueue.main.async {
        let db = Firestore.firestore()
        let currentUserID = Auth.auth().currentUser!.uid
            db.collection("users").document(currentUserID).collection("userInfo").document("profileImage").getDocument { querySnapshot, error in
            
            var paths = [String]()
            
            if error == nil && querySnapshot != nil {
                paths.append(querySnapshot!["url"] as! String)
            }
                
                for path in paths {
                    
                    let storageRef = Storage.storage().reference()
                    let fileRef = storageRef.child(path)
                    
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        if error == nil && data != nil {
                            if let image = UIImage(data: data!) {
                                DispatchQueue.main.async {
                                    self.selectedImage = image
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    
}
