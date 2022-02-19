//
//  WorkoutDetail.swift
//  HelloCoreData
//
//  Created by Joseph DeWeese on 2/19/22.
//

import SwiftUI

struct WorkoutDetail: View {
    
    let coreDM = CoreDataManager()
    let workout: Workout
    @State private var workoutName: String = ""
    @Binding var refreshDatabase: Bool
    
    
    var body: some View {
        VStack {
            TextField(workout.title ?? "", text: $workoutName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !workoutName.isEmpty {
                    workout.title = workoutName
                    coreDM.updateWorkout()
                    refreshDatabase.toggle()
                }
            }
        }.padding()
    }
}

struct WorkoutDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let coreDM = CoreDataManager()
        let workout = Workout(context: coreDM.persistentContainer.viewContext)
        WorkoutDetail(workout: workout,refreshDatabase: .constant(false))
    }
}
