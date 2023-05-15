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
            Text(reminder.title ?? "")
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
