import SwiftUI

struct StocksTab: View {
    @ObservedObject var viewModel: StocksViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.allStocks.filter { $0.isFeatured }) { stock in
                            StockRowView(stock: stock) {
                                viewModel.toggleFavorite(stock)
                            }
                            .frame(width: 250)
                        }
                    }
                    .padding()
                }

                List {
                    ForEach(viewModel.allStocks) { stock in
                        StockRowView(stock: stock) {
                            viewModel.toggleFavorite(stock)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Stocks")
        }
    }
}
