import Foundation

@MainActor
final class StocksViewModel: ObservableObject {
    @Published var allStocks: [StockEntity] = []
    @Published var favoriteStocks: [StockEntity] = []

    private let stockService: StockServiceProtocol
    private let stockStorage: StockStorageProtocol

    init(service: StockServiceProtocol, storage: StockStorageProtocol) {
        self.stockService = service
        self.stockStorage = storage
        loadFromStorage()
        fetchStocks()
    }

    func fetchStocks() {
        Task { @MainActor in
            let stocks = try await stockService.fetchStocks()
            stockStorage.saveOrUpdate(stocks: stocks)
            loadFromStorage()
        }
    }

    func toggleFavorite(_ stock: StockEntity) {
        stockStorage.toggleFavorite(ticker: stock.ticker ?? "")
        loadFromStorage()
    }

    func loadFromStorage() {
        allStocks = stockStorage.fetchStocks()
        favoriteStocks = stockStorage.fetchFavoriteStocks()
    }

    func isFavorite(_ stock: StockEntity) -> Bool {
        stockStorage.isFavorite(ticker: stock.ticker ?? "")
    }
}
