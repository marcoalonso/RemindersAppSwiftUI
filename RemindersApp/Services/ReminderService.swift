//
//  ReminderService.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 02/05/23.
//

import Foundation
import CoreData
import UIKit

class ReminderService {
    
    static var viewContext: NSManagedObjectContext {
        CoreDataProvider.shared.persistentContainer.viewContext
    }
    
    static func save() throws {
        try viewContext.save()
    }
    
    static func saveMyList(_ name: String, _ color: UIColor) throws {
        let myList = MyList(context: viewContext)
        myList.name = name
        myList.color = color
        try save()
    }
    
    static func updateReminder(reminder: Reminder, editConfig: ReminderEditConfig) throws -> Bool {
        let reminderToUptadte = reminder
        reminder.isCompleted = editConfig.isCompleted
        reminder.title = editConfig.title
        reminderToUptadte.notes = editConfig.notes
        reminderToUptadte.reminderDate = editConfig.hasDate ? editConfig.reminderDate : nil
        reminderToUptadte.reminderTime = editConfig.hasTime ? editConfig.reminderTime : nil
        try save()
        return true
    }
    
    static func saveReminderToMyList(myList: MyList, reminderTitle: String) throws {
        let reminder = Reminder(context: viewContext)
        reminder.title = reminderTitle
        myList.addToReminders(reminder)
        try save()
    }
    
    static func getRemindersByList(myList: MyList) -> NSFetchRequest<Reminder> {
        let request = Reminder.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "list = %@ AND isCompleted = false", myList)
        return request
    }
    
}
