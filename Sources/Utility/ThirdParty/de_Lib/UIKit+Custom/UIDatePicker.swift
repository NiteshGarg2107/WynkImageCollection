//
//  UIDatePicker.swift
import Foundation
import UIKit

extension UIDatePicker {
    
    func stringFromDate(format: String, date: Date) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: date)
    }
}
