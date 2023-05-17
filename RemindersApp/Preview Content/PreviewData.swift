//
//  PreviewData.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 03/05/23.
//

import Foundation
import CoreData

class PreviewData {
    
    static var reminder : Reminder {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = Reminder.fetchRequest()
        return(try? viewContext.fetch(request).first) ?? Reminder(context: viewContext)
    }
    
    static var myList: MyList {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = MyList.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? MyList()
    }
}
