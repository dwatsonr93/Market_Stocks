import SwiftUI

@main
struct WorldWinner: App {
    @StateObject private var dependencies = AppDependencies()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(dependencies)
        }
    }
}
