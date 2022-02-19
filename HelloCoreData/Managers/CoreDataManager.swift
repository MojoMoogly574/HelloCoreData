//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Joseph DeWeese on 2/19/22.
//

import Foundation
import CoreData

class CoreDataManager {
    //Initializing Core Data Model
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "WorkoutModel")
        persistentContainer.loadPersistentStores { (description, error ) in
            if let error = error {
                fatalError("Core Data failed to initialize \(error.localizedDescription)")
            }
        }
    }
    func updateWorkout() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
    func deleteWorkout(workout: Workout)   {
        persistentContainer.viewContext.delete(workout)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save content \(error.localizedDescription)")
        }
            
    }
    
    func getAllWorkouts() -> [Workout] {
        
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return[]
        }
    }
    func saveWorkout(workoutName: String ) {
        
        let workout = Workout(context: persistentContainer.viewContext)
        workout.title = workoutName
        
        do {
            try persistentContainer.viewContext.save()
            print("Workout saved!")
        } catch {
            print("Failed to save Workout \(error)")
        }
        
    }
}

