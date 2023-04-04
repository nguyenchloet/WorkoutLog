//
//  ExerciseInput.swift
//  WorkoutLog
//
//  Created by Chloe on 3/31/23.
//

import Foundation
import SwiftUI

/* enum Pages: Int {
    case addWorkout = 0
    case calendar = 1
    case graphs = 2
} */

struct NavBar: View {
    
    //@Binding var selectedPage: Pages
    
    let username: String
    let date = Date()
    
    var body: some View {
        NavigationView {
            HStack {
                Button {
                    //selectedPage = .addWorkout
                } label: {
                    NavigationLink(destination: ExerciseInputView(username: username)) {
                        VStack (alignment: .center, spacing: 4) {
                            Image(systemName: "pencil.tip.crop.circle.badge.plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Add a\nWorkout")

                        }
                    }
                }
                .padding()
                .frame(width: 110, height: 110)
                .border(.blue, width: 3)
                
                Button {
                   //selectedPage = .calendar
                } label: {
                    NavigationLink(destination: CalendarView()) {
                        VStack (alignment: .center, spacing: 4) {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Calendar")

                        }
                    }
                    
                }
                .padding()
                .frame(width: 110, height: 110)
                .border(.blue, width: 3)
                
                Button {
                    //selectedPage = .graphs
                } label: {
                    NavigationLink(destination: GraphsView()) {
                        VStack (alignment: .center, spacing: 4) {
                            Image(systemName: "chart.line.uptrend.xyaxis.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Graphs")

                        }
                    }

                    
                }
                .padding()
                .frame(width: 110, height: 110)
                .border(.blue, width: 3)
            }
            .frame(height: 82)
        }
    }
}
