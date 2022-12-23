//
//  User.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/24/22.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    
    var id: String
    var firstName: String
    var lastName: String
    var birthday: Date
    var accountCreation: Date
    var rating: Double
    var moneyEarned: Double
    var preferredWorkDistance: Int
    var jobsCompleted: Int
    var jobsCreated: Int
    
}
