//
//  Delay.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 02/06/23.
//

import Foundation

class Delay {
    
    private var seconds: Double
    var workItem: DispatchWorkItem?
    
    
    init(seconds: Double = 2.0) {
        self.seconds = seconds
    }
    
    func performWork(_ work: @escaping () -> Void ) {
        workItem = DispatchWorkItem(block: {
            work()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: workItem!)
        
    }
    
    func cancel() {
        workItem?.cancel()
    }
}
