//
//  CoreDataService.swift
//  Assignment 2-3
//
//  Created by ramy on 2022-01-30.
//

import Foundation
import CoreData

class CoreDataService {
    
    static var shared : CoreDataService = CoreDataService()
    
    func addUser(userName: String , password: String){
        let user = User(context: persistentContainer.viewContext)
        user.user_name = userName
        user.user_password = password
        saveContext()
    }
    func getUser(username: String , password: String)-> Bool{
        let fetch : NSFetchRequest<User> = User.fetchRequest()
        fetch.predicate = NSPredicate(format: "(user_name == %@) AND (user_password == %@)", argumentArray: [username , password])
        do{
            let result = try persistentContainer.viewContext.fetch(fetch) as [User]?
            if result?.count == 0 {
                return false
            }else{
                return true
            }
        }catch{}
        return false
    }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Assignment_2_3")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
      }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static var preview: CoreDataService = {
        let result = CoreDataService(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newUser = User(context: viewContext)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
            container = NSPersistentContainer(name: "Assignment_2_3")
            if inMemory {
                container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            }
            container.viewContext.automaticallyMergesChangesFromParent = true
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
}
