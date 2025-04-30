import Foundation

//Temporary data — gets saved into Core Data for long-term use.
//Model for json
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
