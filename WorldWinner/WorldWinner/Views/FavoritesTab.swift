import SwiftUI

struct FavoritesTab: View {
    @ObservedObject var viewModel: StocksViewModel
    @State private var sortAscending: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(sortedFavorites) { stock in
                    StockRowView(stock: stock) {
                        viewModel.toggleFavorite(stock)
                    }
                }
            }
            .navigationTitle("Favorites")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        sortAscending.toggle()
                    }) {
                        Image(systemName: sortAscending ? "arrow.up" : "arrow.down")
                    }
                }
            }
        }
    }

    var sortedFavorites: [StockEntity] {
        viewModel.favoriteStocks.sorted {
            sortAscending ? $0.priceChange24hrs < $1.priceChange24hrs :
                            $0.priceChange24hrs > $1.priceChange24hrs
        }
    }
}
