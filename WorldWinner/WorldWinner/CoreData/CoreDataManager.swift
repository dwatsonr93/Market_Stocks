import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "StockTrackerModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("❌ Core Data failed to load: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        container.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
