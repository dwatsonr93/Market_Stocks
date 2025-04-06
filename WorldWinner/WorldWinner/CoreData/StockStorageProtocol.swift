import Foundation

// Protocol defining storage behavior.
protocol StockStorageProtocol {
    func fetchStocks() -> [StockEntity]
    func fetchFavoriteStocks() -> [StockEntity]
    func saveOrUpdate(stocks: [Stock])
    func toggleFavorite(ticker: String)
    func isFavorite(ticker: String) -> Bool
}
