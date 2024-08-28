//
//  HabitDetailView.swift
//  SwiftIsland Delights
//
//  Created by Malin Sundberg on 2024-08-19.
//

import SwiftUI

struct HabitDetailView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let habit: Habit
    
    @State private var streakTextFont: Font = .subheadline
    
    var body: some View {
        VStack {
            Image(systemName: habit.symbolName)
                .font(.title)
                .foregroundColor(.accent)
                .padding()
                .background {
                    Circle()
                        .fill(.accent.opacity(colorScheme == .light ? 0.1 : 0.2))
                }
                .padding(.top)
            
            Text(habit.name)
                .font(.title)
                .bold()
            
            Text(habit.longStreakText)
                .font(streakTextFont)
                .foregroundStyle(.secondaryAccent)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            MeshGradientView()
                .overlay(Material.regular, in: .rect)
                .ignoresSafeArea()
        }
        .onAppear {
            withAnimation(.bouncy(duration: 0.6).delay(0.2)) {
                streakTextFont = .headline
            }
        }
    }
}

#Preview {
    VStack {
    }.sheet(isPresented: .constant(true)) {
        HabitDetailView(habit: Habit.exampleHabits.first!)
            .presentationDetents([.fraction(0.35)])
            .presentationDragIndicator(.visible)
    }
}
