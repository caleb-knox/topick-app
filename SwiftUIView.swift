//
//  SwiftUIView.swift
//  TopickDraft 2.0
//
//  Created by Caleb Knox on 7/26/22.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.purple.opacity(0.7)
            ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 702, height: 402)
                .foregroundColor(.gray)
                .shadow(radius: 20)
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 700, height: 400)
                .foregroundColor(.white)
                .shadow(radius: 10)
                VStack(spacing: 0) {
                Text("Colombia has decriminalised abortion during the first 24 weeks of pregnancy, adding to a string of legal victories for reproductive rights in Latin America.")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 600, height: 300)
                    .offset(y: 25)
                Rectangle()
                    .frame(width: 400, height: 2)
                    .foregroundColor(.purple.opacity(0.6))
                    .offset(x: -75, y: -25)
                    Text("Thoughts?")
                        .font(.title3)
                        .fontWeight(.light)
                        .frame(width: 600, height: 300)
                        .offset(y: -125)
                }.offset(y: 30)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

struct SwiftUIProf: View {
    var body: some View {
        ZStack {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
            }
            HStack(spacing: 0) {
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.purple)
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
            }
            
        }
            Circle()
                .frame(width: 90, height: 90)
                .foregroundColor(.white)
            Image(systemName: "newspaper")
                .font(.system(size: 50))
                .foregroundColor(.black)
        }
    }
}

struct SwiftUIProf_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIProf()
    }
}
