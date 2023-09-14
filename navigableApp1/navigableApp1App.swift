//
//  navigableApp1App.swift
//  navigableApp1
//
//  Created by Ananya Tandel on 9/14/23.
//

import SwiftUI

@main
struct navigableApp1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
