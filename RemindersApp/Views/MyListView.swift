//
//  MyListView.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 03/05/23.
//

import SwiftUI

struct MyListView: View {
    
    let myLists: FetchedResults<MyList>
    
    var body: some View {
        NavigationStack {
            if myLists.isEmpty {
                Spacer()
                Text("No reminders found!")
            } else {
                ForEach(myLists) { myLists in
                    VStack {
                        MyListCellView(myList: myLists)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading], 10)
                            .font(.title2)
                        Divider()
                    }
                }
            }
        }
    }
}
/*
 
 
struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
 */
