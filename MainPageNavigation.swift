//
//  MainPageNavigation.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/23/22.
//

import SwiftUI

struct MainPageNavigation: View {
    
    @State var tabSelection: Int
    
    @ObservedObject var userManager: UserManager
    @ObservedObject var imagesManager: ImageManager
    @ObservedObject var jobsManager: JobsManager
    
    var body: some View {
        TabView(selection: $tabSelection) {
            FindJobsPage(isCreatePostSheetShowing: false, isMoreJobInfoShowing: false, jobTitle: "", jobDescription: "", address: "", price: "", specialRequests: "", jobsManager: jobsManager, userManager: userManager).onAppear {
                jobsManager.update()
            }
                .padding(.bottom, 40)
                
                .tabItem({
                    Image(systemName: "magnifyingglass")
                })
                .tag(1)
            CurrentJobsPage(isExtraJobInformationSheetShowing: false, isMessagingViewShowing: false, isPostedPageShowing: false, isMoreJobInfoShowing: false, isJobEditingViewShowing: false, isBidsViewShowing: false, isViewProfileShowing: false,  jobsManager: jobsManager)
                .padding(.bottom, 40)
                .tabItem({
                    Image(systemName: "hammer")
                }).onAppear {
                    jobsManager.update()
                }
                .tag(2)
            WorkCalendarPage(dayOfWeekSelected: 1)
                .padding(.bottom, 40)
                .tabItem({
                    Image(systemName: "calendar")
                })
                .tag(3)
            ProfilePage(isProfileCommentsSheetShowing: false, workDistance: userManager.currentUser.preferredWorkDistance, isProfilePageShowing: true, userManager: userManager, imagesManager: imagesManager)
                .padding(.bottom, 70)
                .tabItem({
                    Image(systemName: "person")
                })
                .tag(4)
        }.accentColor(.mint)
    }
}
