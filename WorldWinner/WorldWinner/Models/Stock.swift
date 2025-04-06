import Foundation

struct Stock: Codable, Identifiable, Hashable {
    var id: String { ticker }

    let name: String
    let ticker: String
    let price: Double
    let priceChange24hrs: Double
    let isFeatured: Bool

    enum CodingKeys: String, CodingKey {
        case name, ticker, price
        case priceChange24hrs = "price_change_24hrs"
        case isFeatured = "is_featured"
    }
}
