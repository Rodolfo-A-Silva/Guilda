//
//  Validation.swift
//  Guilda
//
//  Created by rodolfo silva on 03/02/23.
//

import Foundation
import MapKit

public struct Validation {
    
    public static func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: email)
    }
    
    public static func isValidBirthOfDate(text: String) -> Bool {
        if text.count != 8  {
            return false
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        guard let minimumDate = dateFormatter.date(from: "01-01-1900") else {
            return false
        }
        
        let maximumDate = Date()
        dateFormatter.dateFormat = "MMddyyyy"
        guard let birthOfDate = dateFormatter.date(from: text) else {
            return false
        }
        
        return (birthOfDate > minimumDate) && (birthOfDate < maximumDate)
    }
}
