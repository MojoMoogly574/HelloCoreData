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
    
    private func callWorkouts() {
        workouts = coreDM.getAllWorkouts()
    }
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter name of workout", text: $workoutName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    coreDM.saveWorkout(workoutName: workoutName)
                    callWorkouts()
                }
                List {
                    ForEach(workouts, id: \.self) { workout in
                        NavigationLink(
                            destination: WorkoutDetail(workout: workout),
                            label: {
                                Text(workout.title ?? "")
                            })
                    }.onDelete(perform: { IndexSet in
                        IndexSet.forEach { index in
                            let workout = workouts[index]
                            coreDM.deleteWorkout(workout: workout)
                            callWorkouts()
                        }
                    })
                }
                .padding()
                .listStyle(PlainListStyle())
                Spacer()
            }.padding()
                .onAppear(perform: {
                   callWorkouts()
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
