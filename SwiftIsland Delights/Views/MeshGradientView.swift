//
//  MeshGradientView.swift
//  SwiftIsland Delights
//
//  Created by Malin Sundberg on 2024-08-27.
//

import SwiftUI

struct MeshGradientView: View {
    var body: some View {
        TimelineView(.animation) { timeline in
//            let timeValue = timeline.date.timeIntervalSince1970 * 0.2
//            let centerPointX: Float = Float(sin((timeValue) + 1)/2)
//            let centerPointY: Float = Float(sin((timeValue) + 1)/2)
            
            let timeValue = timeline.date.timeIntervalSince1970 * 1.5
            let centerPointX: Float = Float((sin(timeValue) + cos(timeValue * 0.5) + sin(timeValue * 2)) / 6 + 0.5)
            let centerPointY: Float = Float((cos(timeValue + .pi/2) + sin(timeValue * 0.7) + cos(timeValue * 1.3)) / 6 + 0.5)
            
            VStack {
                MeshGradient(width: 3,
                             height: 3,
                             points: [
                                [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                                [0.0, 0.5], [centerPointX, centerPointY], [1.0, 0.5],
                                [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                             ],
                             colors: [
                                .systemBackground, .accentColor, .primaryOrange,
                                .indigo, .indigo, .accentColor,
                                .secondaryAccent, .primaryOrange, .systemBackground
                             ],
                             background: .systemBackground, smoothsColors: true)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    MeshGradientView()
}
