import Foundation

protocol StockServiceProtocol {
    func fetchStocks() async throws -> [Stock]
}
