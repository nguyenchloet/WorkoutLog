//
//  ExerciseInput.swift
//  WorkoutLog
//
//  Created by Chloe on 3/31/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ExerciseInputView: View {
    @ObservedResults(Exercise.self, sortDescriptor: SortDescriptor(keyPath: "date", ascending: true)) var exercises
    let username: String
    //let page: String
    
    @State private var name = ""
    @State private var ownerId = ""
    @State private var program = ""
    @State private var replaced = ""
    @State private var type = ""
    @State private var warmUpSets = 0
    @State private var notes = ""
    
    var body: some View {
        
        VStack {
            Text("Enter Today's Workout")
            TextField("Workout Name", text: $name)
            HStack {
                TextField("Program", text: $program)
                TextField("Type", text: $type)
            }
            
            //TextField("Warm up sets", text: $warmUpSets)
            
            TextField("Replacing another workout?", text: $replaced)

            TextField("Notes", text: $notes)

            Button(action: submit) { Image(systemName: "plus.square.fill")}
                .disabled(name.isEmpty)
            
        }
        //.navigationBarTitle("\(page)")
        .padding()
        
    }
    private func submit() {
        ownerId = username
        
        if !name.isEmpty {
            $exercises.append(Exercise(name: name, ownerId: ownerId, program: program, replaced: replaced, type: type, warmUpSets: warmUpSets, notes: notes))
        }
        
        /*

         @State private var warmUpReps = 0
         @State private var warmUpWeightSet1 = 0.00
         @State private var warmUpWeightSet2 = 0.00
         @State private var warmUpWeightSet3 = 0.00
         @State private var workSets = 0
         @State private var workReps = 0
         @State private var workWeightSet1 = 0.00
         @State private var workWeightSet2 = 0.00
         @State private var workWeightSet3 = 0.00
         
         
         warmUpReps: warmUpReps, warmUpWeightSet1: warmUpWeightSet1, warmUpWeightSet2: warmUpWeightSet2, warmUpWeightSet3: warmUpWeightSet3, workSets: workSets, workReps: workReps, workWeightSet1: workWeightSet1, workWeightSet2: workWeightSet2, workWeightSet3: workWeightSet3,
         
         warmUpReps = 0
         warmUpWeightSet1 = 0.00
         warmUpWeightSet2 = 0.00
         warmUpWeightSet3 = 0.00
         workSets = 0
         workReps = 0
         workWeightSet1 = 0.00
         workWeightSet2 = 0.00
         workWeightSet3 = 0.00
         */
        
        
        name = ""
        notes = ""
    }
}
