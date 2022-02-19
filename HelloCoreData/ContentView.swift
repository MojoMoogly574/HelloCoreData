//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Joseph DeWeese on 2/19/22.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var workoutName: String =  ""
    @State private var workouts: [Workout] = [Workout]()
    
    
    var body: some View {
        VStack {
            TextField("Enter name of workout", text: $workoutName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                coreDM.saveWorkout(workoutName: workoutName)
                workouts = coreDM.getAllWorkouts()
            }
            List(workouts, id: \.self) { workout in
                Text(workout.title ?? "")
            }
            Spacer()
        }.padding()
            .onAppear(perform: {
               workouts = coreDM.getAllWorkouts()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
