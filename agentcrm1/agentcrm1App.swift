//
//  agentcrm1App.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//

import SwiftUI

@main
struct agentcrm1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
