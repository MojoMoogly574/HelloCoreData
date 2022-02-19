//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Joseph DeWeese on 2/19/22.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var workoutTitle: String =  ""
    
    
    var body: some View {
        VStack {
            TextField("Enter name of workout", text: $workoutTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                coreDM.saveWorkout(workoutTitle: workoutTitle)
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
