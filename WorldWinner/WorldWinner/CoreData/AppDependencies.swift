import Foundation

final class AppDependencies: ObservableObject {
    let stockService: StockServiceProtocol
    let stockStorage: StockStorageProtocol

    init(
        stockService: StockServiceProtocol = MockStockService(),
        stockStorage: StockStorageProtocol = CoreDataStockStorage()
    ) {
        self.stockService = stockService
        self.stockStorage = stockStorage
    }
}
