//
//  MessagingPage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/22/22.
//

import SwiftUI

struct MessagingPage: View {
    
    @State var messageToSend: String
    @State var isMessagingViewShowing: Bool
    
    @ObservedObject var jobsManager: JobsManager
    
    var body: some View {
        
        if isMessagingViewShowing {
            VStack {
                HStack(spacing: 0) {
                    Button(action: {
                        isMessagingViewShowing.toggle()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .foregroundColor(.mint)
                    }.offset(x: -90)
                    
                    Text("Bill Joneson")
                        .font(.title)
                        .fontWeight(.thin)
                        .offset(x: -5)
                    
                }
                VStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 31)
                            .foregroundColor(.gray)
                            .padding()
                            .frame(maxWidth: 401, maxHeight: 551)
                            .padding(.bottom, 0)
                            .shadow(radius: 6)
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.bottom, 0)
                            .frame(maxWidth: 400, maxHeight: 550)
                    }
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.mint).opacity(0.4)
                            .shadow(radius: 6)
                            .padding()
                            .frame(maxWidth: 375, maxHeight: 100)
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundColor(.white)
                                .shadow(radius: 6)
                                .padding()
                                .frame(maxWidth: 365, maxHeight: 90)
                            HStack {
                            TextField("Type message here...", text: $messageToSend)
                                
                                Button(action: {
                                    messageToSend = ""
                                }) {
                                    Image(systemName: "paperplane.circle")
                                        .font(.system(size: 30))
                                        .foregroundColor(.orange)
                                }
                            }.padding(.horizontal, 50)
                        }
                    }
                }
                Spacer()
            }
        } else {
            CurrentJobsPage(isExtraJobInformationSheetShowing: false, isMessagingViewShowing: false, isPostedPageShowing: false, isMoreJobInfoShowing: false, isJobEditingViewShowing: false, isBidsViewShowing: false, isViewProfileShowing: false, jobsManager: jobsManager)
        }
    }
}


