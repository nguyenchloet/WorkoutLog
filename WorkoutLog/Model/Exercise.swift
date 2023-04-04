//
//  Exercise.swift
//  WorkoutLog
//
//  Created by Chloe on 3/31/23.
//

import Foundation
import RealmSwift

@objcMembers class Exercise: Object, ObjectKeyIdentifiable {
    /// dynamic variables used so Realm can see when it changes
    dynamic var _id = ObjectId.generate()
    dynamic var name = ""
    dynamic var ownerId = ""
    dynamic var date = Date()
    dynamic var program = ""
    dynamic var replaced = ""
    dynamic var type = ""
    dynamic var warmUpSets = 0

    /*
     dynamic var warmUpReps = 0
     dynamic var warmUpWeightSet1 = 0.00
     dynamic var warmUpWeightSet2 = 0.00
     dynamic var warmUpWeightSet3 = 0.00
     dynamic var workSets = 0
     dynamic var workReps = 0
     dynamic var workWeightSet1 = 0.00
     dynamic var workWeightSet2 = 0.00
     dynamic var workWeightSet3 = 0.00
     
     warmUpReps: Int, warmUpWeightSet1: Double, warmUpWeightSet2: Double, warmUpWeightSet3: Double, workSets: Int, workReps: Int, workWeightSet1: Double, workWeightSet2: Double, workWeightSet3: Double,
     
     self.warmUpReps = warmUpReps
     self.warmUpWeightSet1 = warmUpWeightSet1
     self.warmUpWeightSet2 = warmUpWeightSet2
     self.warmUpWeightSet3 = warmUpWeightSet3
     self.workSets = workSets
     self.workReps = workReps
     self.workWeightSet1 = workWeightSet1
     self.workWeightSet2 = workWeightSet2
     self.workWeightSet3 = workWeightSet3
     */
    dynamic var notes = ""
    
    convenience init (name: String, ownerId: String, program: String, replaced: String, type: String, warmUpSets: Int, notes: String) {
        self.init()
        self.date = Date()
        self.name = name
        self.ownerId = ownerId
        self.program = program
        self.replaced = replaced
        self.type = type
        self.warmUpSets = warmUpSets
        self.notes = notes
    }

    override static func primaryKey() -> String? {
        return "_id"
    }
}
