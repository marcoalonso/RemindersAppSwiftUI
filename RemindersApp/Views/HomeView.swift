//
//  ContentView.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 25/04/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("My List of Reminders")
                
                Spacer()
                
                Button {
                    isPresented = true
                } label: {
                    Text("Add List")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.headline)
                }.padding()
            }
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    AddNewListView { name, color in
                        do {
                            try ReminderService.saveMyList(name, color)
                        } catch {
                            print("Debug: error \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
