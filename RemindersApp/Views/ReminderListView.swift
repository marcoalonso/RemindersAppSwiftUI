//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 15/05/23.
//

import SwiftUI

struct ReminderListView: View {
    
    let reminders: FetchedResults<Reminder>
    
    var body: some View {
        List(reminders) { reminder in
            ReminderCellView(reminder: reminder) { event in
                switch event {
                case .onSelect(let reminder):
                    print("onSelect")
                    
                case .onCheckChange(let reminder):
                    print("onCheckChange")
                    
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
