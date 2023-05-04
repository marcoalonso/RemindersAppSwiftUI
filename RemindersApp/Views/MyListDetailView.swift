//
//  MyListDetailView.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 04/05/23.
//

import SwiftUI

struct MyListDetailView: View {
    @State private var openAddReminder : Bool = false
    @State private var title : String = ""
    
    private var isFormValid: Bool {
        !title.isEmpty
    }
    
    let myList : MyList
    
    var body: some View {
        VStack {
            
            //List Reminders
            
            HStack {
                Button("New Reminder") {
                    openAddReminder = true
                }
            }.foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
        }
        .alert("New Reminder", isPresented: $openAddReminder) {
            TextField("", text: $title)
            Button("Cancel", role: .cancel) { }
            Button("Done") {
             
                if isFormValid {
                    do {
                        try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: title)
                    } catch {
                        print("Debug: error \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

struct MyListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyListDetailView(myList: PreviewData.myList)
    }
}
