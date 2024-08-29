//
//  ExplorationsView.swift
//  SwiftIsland Delights
//
//  Created by Malin Sundberg on 2024-08-24.
//

import SwiftUI

struct ExplorationsView: View {
    @State private var isMuted: Bool = false
    
    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: "party.popper")
                .symbolEffect(.wiggle.counterClockwise, options: .repeat(.continuous).speed(0.5), isActive: true)
            
            Image(systemName: "fan.desk")
                .symbolEffect(.rotate)
            
            Image(systemName: "heart.circle")
                .symbolEffect(.breathe, options: .repeat(3))
            
            Button {
                isMuted.toggle()
            } label: {
                Image(systemName: isMuted ? "bell.slash.fill" : "bell.fill")
                    
            }
            .buttonStyle(.plain)
            .contentTransition(.symbolEffect(.replace))
        }
        .foregroundStyle(Color.accentColor)
        .bold()
        .font(.largeTitle)
    }
}

#Preview {
    ExplorationsView()
}
