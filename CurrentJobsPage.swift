//
//  CurrentJobsPage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct CurrentJobsPage: View {
    
    @State var isExtraJobInformationSheetShowing: Bool
    @State var isMessagingViewShowing: Bool
    @State var isPostedPageShowing: Bool
    
    @State var isMoreJobInfoShowing: Bool
    @State var isJobEditingViewShowing: Bool
    @State var isBidsViewShowing: Bool
    @State var isViewProfileShowing: Bool
    
    @ObservedObject var jobsManager: JobsManager
    
    var body: some View {
        if !isPostedPageShowing {
            if !isMessagingViewShowing {
                VStack {
                    VStack(spacing: 20) {
                    
                    Text("Current Jobs")
                        .font(.title)
                        .foregroundColor(.mint)
                        HStack(spacing: 25) {
                            Button(action: {
                                if isPostedPageShowing {
                                    isPostedPageShowing.toggle()
                                }
                            }) {
                                Text("My Unfinished Jobs")
                                    .foregroundColor(.orange)
                                    .font(.headline)
                                    .underline(color: isPostedPageShowing ? .clear : .cyan)
                            }
                            Button(action: {
                                if !isPostedPageShowing {
                                    isPostedPageShowing.toggle()
                                }
                            }) {
                                Text("My Job Posts")
                                    .foregroundColor(.cyan)
                                    .font(.headline)
                                    .underline(color: isPostedPageShowing ? .orange : .clear)
                            }
                        }
                    }
                    ScrollView {
                        Text("")
                        VStack(spacing: 10) {
                            ForEach(jobsManager.myJobsToDo, id: \.id) { jobsToDo in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 21)
                                        .foregroundColor(.gray)
                                        .frame(width: 376, height: 101)
                                        .shadow(radius: 1)
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.white)
                                        .frame(width: 375, height: 100)
                                    // Info within Job posting
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("\(jobsToDo.jobTitle)")
                                                .foregroundColor(.black)
                                                .font(.title2)
                                                .fontWeight(.light)
                                            Text("\(jobsToDo.creatorName)")
                                                .font(.headline)
                                                .fontWeight(.light)
                                                .foregroundColor(.black).opacity(0.7)
                                        }
                                        Divider().frame(width: 50)
                                        HStack(spacing: 15) {
                                            Button(action: {
                                                isMessagingViewShowing.toggle()
                                            }) {
                                                Image(systemName: "message")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.cyan)
                                            }
                                            Button(action: {
                                                
                                            }) {
                                                Image(systemName: "car")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.mint)
                                            }
                                            
                                            Button(action: {
                                                isExtraJobInformationSheetShowing.toggle()
                                            }) {
                                                Image(systemName: "circle.hexagongrid")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.orange)
                                            }.sheet(isPresented: $isExtraJobInformationSheetShowing, onDismiss: nil) {
                                                VStack {
                                                    HStack {
                                                        Button(action: {
                                                            isExtraJobInformationSheetShowing.toggle()
                                                        }) {
                                                            Text("Back to Current Jobs")
                                                                .foregroundColor(.mint)
                                            
                                                                .padding(20)
                                                        }
                                                        Spacer()
                                                    }
                                                    Spacer()
                                                    Text("")
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }.padding(10)
                }
            } else {
                MessagingPage(messageToSend: "", isMessagingViewShowing: true, jobsManager: jobsManager)
            }
        } else {
            VStack {
            VStack(spacing: 20) {
            
            Text("Current Jobs")
                .font(.title)
                .foregroundColor(.mint)
                HStack(spacing: 25) {
                    Button(action: {
                        if isPostedPageShowing {
                            isPostedPageShowing.toggle()
                        }
                    }) {
                        Text("My Unfinished Jobs")
                            .foregroundColor(.orange)
                            .font(.headline)
                            .underline(color: isPostedPageShowing ? .clear : .cyan)
                    }
                    Button(action: {
                        if !isPostedPageShowing {
                            isPostedPageShowing.toggle()
                        }
                    }) {
                        Text("My Job Posts")
                            .foregroundColor(.cyan)
                            .font(.headline)
                            .underline(color: isPostedPageShowing ? .orange : .clear)
                    }
                }
                    VStack {
                        ForEach(jobsManager.myJobsPosted, id: \.id)  { jobPosted in
                            ScrollView {
                                Text("")
                                ZStack {
                                    RoundedRectangle(cornerRadius: 21)
                                        .foregroundColor(.gray)
                                        .frame(width: 376, height: 101)
                                        .shadow(radius: 1)
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.white)
                                        .frame(width: 375, height: 100)
                                    // Info within Job posting
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("\(jobPosted.jobTitle)")
                                                .foregroundColor(.black)
                                                .font(.title2)
                                                .fontWeight(.light)
                                            
                                        }
                                        Divider().frame(width: 50)
                                        HStack(spacing: 15) {
                                            Button(action: {
                                                jobsManager.getBids(jobID: jobPosted.id)
                                            }) {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 11)
                                                        .frame(width: 53, height: 28)
                                                        .foregroundColor(.orange)
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .frame(width: 50, height: 25)
                                                        .foregroundColor(.white)
                                                    Text("Bids")
                                                        .foregroundColor(.gray)
                                                }
                                            }.sheet(isPresented: $isBidsViewShowing, onDismiss: nil) {
                                                VStack {
                                                    HStack {
                                                        Button(action: {
                                                            isJobEditingViewShowing.toggle()
                                                        }) {
                                                            Text("Back to My Posted Jobs")
                                                                .foregroundColor(.mint)
                                            
                                                                .padding(20)
                                                        }
                                                        Spacer()
                                                    }
                                                    
                                                    Spacer()
                                                    Text("")
                                                    Text("Current Job Bids")
                                                        .font(.title)
                                                        .foregroundColor(.mint)
                                                    VStack {
                                                        ForEach(jobsManager.jobBids, id: \.id) { jobBid in
                                                        ScrollView {
                                                            ZStack {
                                                                RoundedRectangle(cornerRadius: 21)
                                                                    .foregroundColor(.gray)
                                                                    .frame(width: 376, height: 101)
                                                                    .shadow(radius: 1)
                                                                RoundedRectangle(cornerRadius: 20)
                                                                    .foregroundColor(.white)
                                                                    .frame(width: 375, height: 100)
                                                                // Info within Job posting
                                                                HStack {
                                                                    VStack(alignment: .leading, spacing: 5) {
                                                                        Text("\(jobBid.firstName) \(jobBid.lastName)")
                                                                            .foregroundColor(.black)
                                                                            .font(.title2)
                                                                            .fontWeight(.light)
                                                                        
                                                                    }
                                                                    Divider().frame(width: 50)
                                                                    HStack(spacing: 15) {
                                                                        Button(action: {
                                                                            isViewProfileShowing.toggle()
                                                                        }) {
                                                                            ZStack {
                                                                                RoundedRectangle(cornerRadius: 11)
                                                                                    .frame(width: 103, height: 28)
                                                                                    .foregroundColor(.orange)
                                                                                RoundedRectangle(cornerRadius: 10)
                                                                                    .frame(width: 100, height: 25)
                                                                                    .foregroundColor(.white)
                                                                                Text("View Profile")
                                                                                    .foregroundColor(.gray)
                                                                            }
                                                                        }.sheet(isPresented: $isViewProfileShowing, onDismiss: nil) {
                                                                            VStack {
                                                                                HStack {
                                                                                    Button(action: {
                                                                                        isViewProfileShowing.toggle()
                                                                                    }) {
                                                                                        Text("Back to Bids")
                                                                                            .foregroundColor(.mint)
                                                                        
                                                                                            .padding(20)
                                                                                    }
                                                                                    Spacer()
                                                                                }
                                                                                
                                                                                Spacer()
                                                                                Text("")
                                                                            }
                                                                        }
                                                                        Button(action: {
                                                                            
                                                                        }) {
                                                                            Image(systemName: "checkmark.circle.fill")
                                                                                .font(.system(size: 25))
                                                                                .foregroundColor(.cyan)
                                                                                
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
                                                isJobEditingViewShowing.toggle()
                                            }) {
                                                Image(systemName: "square.and.pencil")
                                                    .font(.system(size: 25))
                                                    .foregroundColor(.cyan)
                                            }.sheet(isPresented: $isJobEditingViewShowing, onDismiss: nil) {
                                                VStack {
                                                    HStack {
                                                        Button(action: {
                                                            isJobEditingViewShowing.toggle()
                                                        }) {
                                                            Text("Back to My Posted Jobs")
                                                                .foregroundColor(.mint)
                                            
                                                                .padding(20)
                                                        }
                                                        Spacer()
                                                    }
                                                    
                                                    Spacer()
                                                    Text("")
                                                }
                                            }
                                        }
                                    }
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

