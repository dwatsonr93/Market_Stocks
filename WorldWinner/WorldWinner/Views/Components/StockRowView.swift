import SwiftUI

struct StockRowView: View {
    let stock: StockEntity
    let onFavoriteToggle: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.name ?? "")
                    .font(.headline)
                Text(stock.ticker ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(String(format: "$%.2f", stock.price))
                    .bold()
                Text(String(format: "%.2f%%", stock.priceChange24hrs))
                    .foregroundColor(stock.priceChange24hrs >= 0 ? .green : .red)
            }

            Button(action: onFavoriteToggle) {
                Image(systemName: stock.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 8)
    }
}
