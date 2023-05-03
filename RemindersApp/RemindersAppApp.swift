//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 25/04/23.
//

import SwiftUI

@main
struct RemindersAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
            /// - To pass the context though all views on the app
        }
    }
}
