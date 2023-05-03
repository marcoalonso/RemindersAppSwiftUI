//
//  UIColorTransformer.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 02/05/23.
//

import Foundation
import UIKit
 


class UIColorTransformer: ValueTransformer {

    ///- This method allow us convert  the color to data to can save it on core data
    override func transformedValue(_ value: Any?) -> Any? {

        guard let color = value as? UIColor else { return nil }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }

    }

    ///- This method allow us convert  the data to color to can read it from core data
    override func reverseTransformedValue(_ value: Any?) -> Any? {

        guard let data = value as? Data else { return nil }

        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return color
        } catch {
            return nil
        }

    }

}
