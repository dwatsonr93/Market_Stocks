import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
   
    let container: NSPersistentContainer //Initializes The Core Data stack.

    private init() {
        container = NSPersistentContainer(name: "StockTrackerModel") //Loads the model "StockTrackerModel"
        container.loadPersistentStores { _, error in
            if let error = error {
                print("❌ Core Data failed to load: \(error)")
            }
        }
    }

    //Exposes context
    var context: NSManagedObjectContext {
        container.viewContext
    }

    //saveContext for file changes
    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
