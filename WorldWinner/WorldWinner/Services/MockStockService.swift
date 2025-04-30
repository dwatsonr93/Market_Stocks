import Foundation

final class MockStockService: StockServiceProtocol {
    func fetchStocks() async throws -> [Stock] {
        try await Task.sleep(nanoseconds: 1_000_000_000)

        guard let url = Bundle.main.url(forResource: "example_response", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Stock].self, from: data)
    }
}
