//
//  HabitSymbolButtonStyle.swift
//  SwiftIsland Delights
//
//  Created by Malin Sundberg on 2024-08-22.
//

import SwiftUI

struct HabitSymbolButtonStyle: PrimitiveButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var isAnimatingSymbol: Bool = false
//    @GestureState private var isPressed: Bool = false
    
    @State private var isCompleting: Bool = false
    @State private var isComplete: Bool = false
    
    var shouldShowAsPressed: Bool {
        isCompleting && !isComplete
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.medium)
            .symbolEffect(isActive: isAnimatingSymbol)
            .foregroundStyle(shouldShowAsPressed ? .secondaryAccent : .accent)
            .padding(Constants.spacing)
            .background {
                Circle()
                    .fill(shouldShowAsPressed ? .secondaryAccent.opacity(colorScheme == .light ? 0.2 : 0.3) : .accent.opacity(colorScheme == .light ? 0.1 : 0.2))
                    .overlay(content: {
                        Circle()
                            .trim(from: 0, to: isCompleting ? 1 : 0)
                            .stroke(Color.accentColor.opacity(0.5), lineWidth: 4)
                            .padding(2)
                            .rotationEffect(.degrees(-90))
                    })
            }
            .scaleEffect(shouldShowAsPressed ? 1.15 : 1)
            .onLongPressGesture(minimumDuration: 1.8, maximumDistance: 10, perform: {
                configuration.trigger()
                
                withAnimation {
                    isComplete = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50)) {
                    isAnimatingSymbol.toggle()
                }
            }, onPressingChanged: { isPressing in
                if isPressing {
                    withAnimation(.easeInOut(duration: 1.8)) {
                        isCompleting = true
                    }
                } else if !isComplete {
                    withAnimation {
                        isCompleting = false
                    }
                }
            })
//            .onTapGesture {
//                configuration.trigger()
//                isAnimating.toggle()
//            }
//            .simultaneousGesture(DragGesture(minimumDistance: 0).updating($isPressed) { _, gestureState, _ in
//                gestureState = true
//            })
    }
}

extension PrimitiveButtonStyle where Self == HabitSymbolButtonStyle {
    static var habitSymbolButtonStyle: Self { Self() }
}

extension View {
    @ViewBuilder
    func symbolEffect(isActive: Bool) -> some View {
        if #available(iOS 18.0, macOS 15.0, watchOS 11.0, *) {
            symbolEffect(.wiggle.counterClockwise, options: .nonRepeating.speed(1), value: isActive)
                .symbolEffect(.bounce, options: .nonRepeating.speed(1), value: isActive)
        } else {
            symbolEffect(.bounce, options: .nonRepeating.speed(1), value: isActive)
        }
    }
}
