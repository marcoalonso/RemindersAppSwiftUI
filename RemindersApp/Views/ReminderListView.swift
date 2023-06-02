//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 15/05/23.
//

import SwiftUI

struct ReminderListView: View {
    
    let reminders: FetchedResults<Reminder>
    
    private func reminderCheckedChanged(reminder: Reminder) {
        var editConfig = ReminderEditConfig(reminder: reminder)
        editConfig.isCompleted = !reminder.isCompleted
        
        do {
         let _ = try ReminderService.updateReminder(reminder: reminder, editConfig: editConfig)
        } catch {
            print("Debug: error \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        List(reminders) { reminder in
            ReminderCellView(reminder: reminder) { event in
                switch event {
                case .onSelect(let reminder):
                    print("onSelect")
                    
                case .onCheckChange(let reminder):
                    reminderCheckedChanged(reminder: reminder)
                    
                case .onInfo:
                    print("onInfo")
                }
            }
        }
    }
}

/*
 
 
struct ReminderListView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListView()
    }
}
 */
