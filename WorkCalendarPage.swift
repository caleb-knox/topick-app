//
//  WorkCalendarPage.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/23/22.
//

import SwiftUI

struct WorkCalendarPage: View {
    
    @State var dayOfWeekSelected: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Upcoming Jobs")
                .font(.title)
                .foregroundColor(.mint)
            HStack(spacing: 25) {
                Button(action: {
                    dayOfWeekSelected = 1
                }) {
                    Text("23")
                        .font(.system(size: 25))
                        .underline(dayOfWeekSelected == 1 ? true : false, color: .orange)
                        .fontWeight(.thin)
                        .foregroundColor(dayOfWeekSelected == 1 ? .cyan : .black.opacity(0.8))
                }
                Button(action: {
                    dayOfWeekSelected = 2
                }) {
                    Text("24")
                        .font(.system(size: 25))
                        .underline(dayOfWeekSelected == 2 ? true : false, color: .orange)
                        .fontWeight(.thin)
                        .foregroundColor(dayOfWeekSelected == 2 ? .cyan : .black.opacity(0.8))
                        
                }
                Button(action: {
                    dayOfWeekSelected = 3
                }) {
                    Text("25")
                        .font(.system(size: 25))
                        .underline(dayOfWeekSelected == 3 ? true : false, color: .orange)
                        .fontWeight(.thin)
                        .foregroundColor(dayOfWeekSelected == 3 ? .cyan : .black.opacity(0.8))
                }
                Button(action: {
                    dayOfWeekSelected = 4
                }) {
                    Text("26")
                        .font(.system(size: 25))
                        .underline(dayOfWeekSelected == 4 ? true : false, color: .orange)
                        .fontWeight(.thin)
                        .foregroundColor(dayOfWeekSelected == 4 ? .cyan : .black.opacity(0.8))
                }
                Button(action: {
                    dayOfWeekSelected = 5
                }) {
                    Text("27")
                        .font(.system(size: 25))
                        .underline(dayOfWeekSelected == 5 ? true : false, color: .orange)
                        .fontWeight(.thin)
                        .foregroundColor(dayOfWeekSelected == 5 ? .cyan : .black.opacity(0.8))
                }
                Button(action: {
                    dayOfWeekSelected = 6
                }) {
                    Text("28")
                        .font(.system(size: 25))
                        .underline(dayOfWeekSelected == 6 ? true : false, color: .orange)
                        .fontWeight(.thin)
                        .foregroundColor(dayOfWeekSelected == 6 ? .cyan : .black.opacity(0.8))
                }
                Button(action: {
                    dayOfWeekSelected = 7
                }) {
                    Text("29")
                        .font(.system(size: 25))
                        .underline(dayOfWeekSelected == 7 ? true : false, color: .orange)
                        .fontWeight(.thin)
                        .foregroundColor(dayOfWeekSelected == 7 ? .cyan : .black.opacity(0.8))
                }
            }
            Spacer()
        }.padding()
    }
}

struct WorkCalendarPage_Previews: PreviewProvider {
    static var previews: some View {
        WorkCalendarPage(dayOfWeekSelected: 1)
    }
}
