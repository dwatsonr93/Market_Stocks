import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var dependencies: AppDependencies

    var body: some View {
        let viewModel = StocksViewModel(
            service: dependencies.stockService,
            storage: dependencies.stockStorage
        )

        TabView {
            StocksTab(viewModel: viewModel)
                .tabItem {
                    Label("Stocks", systemImage: "chart.line.uptrend.xyaxis")
                }

            FavoritesTab(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}
