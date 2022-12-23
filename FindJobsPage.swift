//
//  FindJobsPage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct FindJobsPage: View {

    @State var isCreatePostSheetShowing: Bool
    @State var isMoreJobInfoShowing: Bool
    
    @State var jobTitle: String
    @State var jobDescription: String
    @State var address: String
    @State var price: String
    @State var specialRequests: String
    
    @State private var jobDate = Date()
    
    @ObservedObject var jobsManager: JobsManager
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Jobs near you")
                .font(.title)
                .foregroundColor(.mint)
            ScrollView {
                VStack(spacing: 20) {
                    Text("")
                    ForEach(jobsManager.jobs, id: \.id) { job in
                        if !jobsManager.myJobsToDo.contains(job) {
                            Button(action: {
                                isMoreJobInfoShowing.toggle()
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 21)
                                        .foregroundColor(.gray)
                                        .frame(width: 376, height: 151)
                                        .shadow(radius: 3)
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.white)
                                        .frame(width: 375, height: 150)
                                    // Info within Job posting
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("\(job.jobTitle)")
                                                .foregroundColor(.black)
                                                .font(.title2)
                                                .fontWeight(.light)
                                            Text("\(job.creatorName)")
                                                .font(.headline)
                                                .fontWeight(.light)
                                                .foregroundColor(.black).opacity(0.7)
                                            Rectangle()
                                                .frame(width: 125, height: 1)
                                                .offset(y: 20)
                                                .foregroundColor(.gray)
                                            Text("2.1 miles away")
                                                .font(.headline)
                                                .foregroundColor(Color("PrimaryColor"))
                                                .offset(y: 40)
                                            
                                        }.offset(x: -30, y: -25)
                                        VStack {
                                            Text("\(job.timeCreated.timeIntervalSinceNow * -1)")
                                                .font(.headline)
                                                .fontWeight(.light)
                                                .foregroundColor(.black).opacity(0.7)
                                                .offset(x: 50, y: -40)
                                            Text("\(job.timeNeededBy.formatted())")
                                                .offset(x: 30, y: 35)
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                            }.sheet(isPresented: $isMoreJobInfoShowing, onDismiss: nil) {
                                
                                VStack(spacing: 20) {
                                    HStack {
                                        Button(action: {
                                            isMoreJobInfoShowing.toggle()
                                        }) {
                                            Text("Back to Jobs")
                                                .foregroundColor(.mint)
                            
                                                .padding(20)
                                        }
                                        Spacer()
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 21)
                                            .foregroundColor(.gray)
                                            .frame(width: 376, height: 151)
                                            .shadow(radius: 3)
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(.white)
                                            .frame(width: 375, height: 150)
                                        // Info within Job posting
                                        HStack {
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("\(job.jobTitle)")
                                                    .foregroundColor(.black)
                                                    .font(.title2)
                                                    .fontWeight(.light)
                                                Text("\(job.creatorName)")
                                                    .font(.headline)
                                                    .fontWeight(.light)
                                                    .foregroundColor(.black).opacity(0.7)
                                                Rectangle()
                                                    .frame(width: 125, height: 1)
                                                    .offset(y: 20)
                                                    .foregroundColor(.gray)
                                                Text("2.1 miles away")
                                                    .font(.headline)
                                                    .foregroundColor(Color("PrimaryColor"))
                                                    .offset(y: 40)
                                                
                                            }.offset(x: -30, y: -25)
                                            VStack {
                                                Text("6 hours ago")
                                                    .font(.headline)
                                                    .fontWeight(.light)
                                                    .foregroundColor(.black).opacity(0.7)
                                                    .offset(x: 50, y: -40)
                                                Text("Post Not Verified")
                                                    .offset(x: 30, y: 35)
                                                    .foregroundColor(.red)
                                            }
                                        }
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 21)
                                            .foregroundColor(.gray)
                                            .frame(width: 376, height: 251)
                                            .shadow(radius: 3)
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(.white)
                                            .frame(width: 375, height: 250)
                                        Text("\(job.description)")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                            .padding()
                                            .offset(y: -50)
                                    }
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 21)
                                                .foregroundColor(.gray)
                                                .frame(width: 101, height: 101)
                                                .shadow(radius: 3)
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.white)
                                                .frame(width: 100, height: 100)
                                            Image(systemName: "plus")
                                                .font(.title)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 21)
                                                .foregroundColor(.gray)
                                                .frame(width: 101, height: 101)
                                                .shadow(radius: 3)
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.white)
                                                .frame(width: 100, height: 100)
                                            Image(systemName: "plus")
                                                .font(.title)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 21)
                                                .foregroundColor(.gray)
                                                .frame(width: 101, height: 101)
                                                .shadow(radius: 3)
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.white)
                                                .frame(width: 100, height: 100)
                                            Image(systemName: "plus")
                                                .font(.title)
                                        }
                                    }
                                    Button(action: {
                                        jobsManager.addMyJobsToDo(job: job)
                                        
                                        jobsManager.update()
                                        isMoreJobInfoShowing.toggle()
                                    }) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 250, height: 60)
                                                .foregroundColor(.orange)
                                                .shadow(radius: 4)
                                            HStack(spacing: 10) {
                                                Text("Accept Job")
                                                    .font(.title2)
                                                    .foregroundColor(.white)
                                                
                                                    
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Button(action: {
                isCreatePostSheetShowing.toggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 60)
                        .foregroundColor(.mint)
                        .shadow(radius: 4)
                    HStack(spacing: 10) {
                        Text("Post a Job")
                            .font(.title2)
                            .foregroundColor(.white)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            
                    }
                }
            }.sheet(isPresented: $isCreatePostSheetShowing, onDismiss: nil) {
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            isCreatePostSheetShowing.toggle()
                        }) {
                            Text("Back to Jobs")
                                .foregroundColor(.mint)
            
                                .padding(20)
                        }
                        Spacer()
                    }
                    Text("")
                    VStack(spacing: 30) {
                        TextField("Enter job title here (max. 20 characters)...", text: $jobTitle)
                            .padding()
                        TextField("Enter job description here...", text: $jobDescription)
                            .padding()
                        TextField("Enter Address here (only seen upon request)...", text: $address)
                            .padding()
                        TextField("Enter the price...", text: $price)
                            .padding()
                        TextField("Any special requests?...", text: $specialRequests)
                            .padding()
                        VStack {
                            Text("When will this job happen ( Max. 1 week advance)")
                                .foregroundColor(.gray)
                            DatePicker("", selection: $jobDate, displayedComponents: [.date, .hourAndMinute])
                                        .labelsHidden()
                                        .accentColor(.orange)
                                        
                            
                        }
                            Button(action: {
                                if !jobTitle.isEmpty && !jobDescription.isEmpty && !address.isEmpty && !price.isEmpty {
                                    jobsManager.addJob(timeNeededBy: jobDate, creatorName: "\(userManager.currentUser.firstName) \(userManager.currentUser.lastName)", jobTitle: jobTitle, description: jobDescription, specialRequests: specialRequests, price: Int(price) ?? 0, address: address)
                                    jobsManager.update()
                                    isCreatePostSheetShowing.toggle()
                                }
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 200, height: 60)
                                        .foregroundColor(.mint)
                                        .shadow(radius: 4)
                                    HStack(spacing: 10) {
                                        Text("Post")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                        
                                            
                                    }
                                }
                            }
                        
                    }
                    Spacer()
                }
            }
        }
    }
}
