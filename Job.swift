//
//  Job.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/25/22.
//

import Foundation

struct Job: Identifiable, Codable, Hashable {
    
    var id: String
    var createdUserID: String
    var creatorName: String
    var jobTitle: String
    var timeCreated: Date
    var timeNeededBy: Date
    var description: String
    var specialRequests: String
    var price: Int
    var address: String
    
}
