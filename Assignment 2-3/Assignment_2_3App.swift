//
//  Assignment_2_3App.swift
//  Assignment 2-3
//
//  Created by ramy on 2022-01-30.
//

import SwiftUI

@main
struct Assignment_2_3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
