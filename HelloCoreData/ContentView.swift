//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Joseph DeWeese on 2/19/22.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
