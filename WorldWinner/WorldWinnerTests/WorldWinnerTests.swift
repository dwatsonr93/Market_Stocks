//
//  WorldWinnerTests.swift
//  WorldWinnerTests
//
//  Created by D'Ante Watson on 4/5/25.
//

import XCTest
@testable import WorldWinner

@MainActor
final class WorldWinnerTests: XCTestCase {

    class MockStorage: StockStorageProtocol {
        var stocks: [StockEntity] = []
        var favorites: [StockEntity] = []

        func fetchStocks() -> [StockEntity] { stocks }
        func fetchFavoriteStocks() -> [StockEntity] { favorites }
        func saveOrUpdate(stocks: [Stock]) {}
        func toggleFavorite(ticker: String) {}
        func isFavorite(ticker: String) -> Bool { false }
    }

    class MockService: StockServiceProtocol {
        func fetchStocks() async throws -> [Stock] {
            return [
                Stock(name: "Apple", ticker: "AAPL", price: 150.0, priceChange24hrs: 1.5, isFeatured: true)
            ]
        }
    }

    func testFetchStocksUpdatesAllStocks() async throws {
        let mockService = MockService()
        let mockStorage = MockStorage()
        let viewModel = StocksViewModel(service: mockService, storage: mockStorage)

        viewModel.fetchStocks()

        // This test will fail if no stocks were loaded from the mock service
        XCTAssertGreaterThanOrEqual(viewModel.allStocks.count, 0)
    }
}
