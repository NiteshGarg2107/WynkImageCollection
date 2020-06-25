//
//  Date.swift
import UIKit

extension Date {

    func string(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    /**
     This function return a date after a given value.
     - Author:  Nitesh Garg
     - Returns: Date
     - Remark:
     - Parameters:
        - component: This define the calander component for the date.
        - value: This define how much time the date will given.
     */
    func getDateAfter(component: Calendar.Component, value: Int) -> Date {
        return  Calendar.current.date(byAdding: component, value: value, to: self)!
    }
    
    func StringFromStyle(_ datestyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datestyle
        dateFormatter.timeStyle = timeStyle
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func timeInterval(toDate: NSDate, components: Set<Calendar.Component>) -> DateComponents {
        return Calendar.current.dateComponents(components, from: self, to: Date())
    }
}

//////////////////////////////////////////////////////////////////////////////////////////

/*
 String extension only for date methods
 */
extension String {
    
    func date(_ format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
//        let medDate = dateFormatter.date(from: self)
//        let secondFormatter = DateFormatter()
//        secondFormatter.dateFormat = "dd-MM-yyyy"
//        print(secondFormatter.string(from: medDate!))
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from: self)!
    }
    
    func dateFromStyle(_ datestyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datestyle
        dateFormatter.timeStyle = timeStyle
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from: self)!
    }
    
    func ChallengeImageUrl() -> URL? {
        let imageURL = URL(string: "\(String(describing: ChallengeImageUrl))/\(self)")
        return imageURL
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[start ..< end])
    }
}
