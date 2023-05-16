//
//  UserInfoController.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 16/05/2023.
//

import Foundation
import CoreData

class UserInfoController: ObservableObject {
    let container = NSPersistentContainer(name: "UserInfoModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("not save")
        }
        
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        let user = UserInfo(context: context)
        user.id = UUID()
        user.date = Date()
        user.calories = calories
        user.name = name
        
        save(context: context)
    }
    
    func editFood(food: UserInfo, name: String, calories: Double, context: NSManagedObjectContext) {
            food.date = Date()
            food.name = name
            food.calories = calories
            
            save(context: context)
        }
}
