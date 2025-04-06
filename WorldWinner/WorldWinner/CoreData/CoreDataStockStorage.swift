import CoreData

final class CoreDataStockStorage: StockStorageProtocol {
    private let context = CoreDataManager.shared.context

    func fetchStocks() -> [StockEntity] {
        let request: NSFetchRequest<StockEntity> = StockEntity.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }

    func fetchFavoriteStocks() -> [StockEntity] {
        let request: NSFetchRequest<StockEntity> = StockEntity.fetchRequest()
        request.predicate = NSPredicate(format: "isFavorite == YES")
        return (try? context.fetch(request)) ?? []
    }

    func saveOrUpdate(stocks: [Stock]) {
        for stock in stocks {
            let request: NSFetchRequest<StockEntity> = StockEntity.fetchRequest()
            request.predicate = NSPredicate(format: "ticker == %@", stock.ticker)

            let entity = (try? context.fetch(request))?.first ?? StockEntity(context: context)
            entity.name = stock.name
            entity.ticker = stock.ticker
            entity.price = stock.price
            entity.priceChange24hrs = stock.priceChange24hrs
            entity.isFeatured = stock.isFeatured
        }
        CoreDataManager.shared.saveContext()
    }

    func toggleFavorite(ticker: String) {
        let request: NSFetchRequest<StockEntity> = StockEntity.fetchRequest()
        request.predicate = NSPredicate(format: "ticker == %@", ticker)
        if let stock = try? context.fetch(request).first {
            stock.isFavorite.toggle()
            CoreDataManager.shared.saveContext()
        }
    }

    func isFavorite(ticker: String) -> Bool {
        let request: NSFetchRequest<StockEntity> = StockEntity.fetchRequest()
        request.predicate = NSPredicate(format: "ticker == %@", ticker)
        return (try? context.fetch(request).first?.isFavorite) ?? false
    }
}
