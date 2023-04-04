//
//  WorkoutLogApp.swift
//  WorkoutLog
//
//  Created by Chloe on 3/31/23.
//

import SwiftUI
import RealmSwift

let app = RealmSwift.App(id: "workoutlog-fwolt")

@main
struct WorkoutLogApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
