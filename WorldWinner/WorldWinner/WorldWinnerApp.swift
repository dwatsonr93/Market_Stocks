//
//  WorldWinnerApp.swift
//  WorldWinner
//
//  Created by D'Ante Watson on 4/5/25.
//

import SwiftUI

@main
struct WorldWinnerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
