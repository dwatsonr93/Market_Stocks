# task-WorldWinner
A SwiftUI-based iOS app for browsing and favoriting stock data, backed by Core Data for persistence.

---

## 🛠 Features

- View featured and all stocks in a two-tab layout
- Favorite/unfavorite stocks with one tap
- Sort favorites by price change
- Data persistence using Core Data
- Fully adaptive UI for light & dark mode
- MVVM architecture with testable components
- Dependency Injection for services and storage
- Mocked API response using local JSON

---

## 🧪 Technologies

- SwiftUI
- Core Data
- MVVM
- Swift Concurrency (`async/await`)
- XCTest

## 📂 Structure
├── WorldWinnerHW.swift
├── CoreData/
│   ├── CoreDataManager.swift
│   ├── CoreDataStockStorage.swift
│   ├── StockStorageProtocol.swift
│   └── AppDependencies.swift
├── Models/
│   └── Stock.swift
├── Resources/
│   └── example_response.json
├── Services/
│   ├── StockServiceProtocol.swift
│   └── MockStockService.swift
├── ViewModels/
│   └── StocksViewModel.swift
├── Views/
│   ├── MainTabView.swift
│   ├── StocksTab.swift
│   ├── FavoritesTab.swift
│   └── Components/
│       └── StockRowView.swift
└── Tests/
    └── StocksViewModelTests.swift
    
## ✅ Setup

1. Open `WorldWinner.xcodeproj` in Xcode.
2. Add a Core Data model named `StockTrackerModel.xcdatamodeld` with an entity:
   - **StockEntity**:
     - `name: String`
     - `ticker: String`
     - `price: Double`
     - `priceChange24hrs: Double`
     - `isFeatured: Bool`
     - `isFavorite: Bool` (default: false)
3. Run on iOS Simulator or device (iOS 16+ recommended).
4. Run tests via **Product > Test**.

---

## 📎 Credits

Built by D’Ante Watson  
Senior iOS Engineer

