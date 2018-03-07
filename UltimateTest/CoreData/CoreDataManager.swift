//
//  CoreDataManager.swift
//  UltimateTest
//
//  Created by SMILEY-ANDREWS, Simon on 6/3/18.
//  Copyright © 2018 SMILEY-ANDREWS, Simon. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    var managedContext: NSManagedObjectContext
    
    static let sharedInstance = CoreDataManager()
    private override init() {
        // This prevents others from using the default '()' initializer for this class.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }

    func createEntity(entityName: String) -> Any? {
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedContext)
    }

    func fetchEntities(with entityName: String) -> [Any?] {
        return self.fetchEntities(with: entityName, predicate: nil)
    }
    
    func fetchEntities(with entityName: String, predicate: NSPredicate?) -> [Any?] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext)
        
        if entity == nil {
            return []
        }
        
        fetchRequest.entity = entity
        if predicate != nil {
            fetchRequest.predicate = predicate
        }
        
        let entities = try! managedContext.fetch(fetchRequest)
        
        return entities
    }
    
    func save() {
        do {
            try managedContext.save()
        } catch {
            print("Failed saving")
        }
    }
}

