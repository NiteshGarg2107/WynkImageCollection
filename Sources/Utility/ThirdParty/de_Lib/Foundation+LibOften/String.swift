//
//  String.swift
import UIKit

extension String {

    var isEmpty: Bool {
        return count == 0 && trimmingCharacters(in: .whitespaces).count == 0
    }
    
    var float: Float? {
        return Float(self)
    }
    
    var int: Int? {
        return Int(self)
    }
    
    var length: Int {
        return count
    }
    
    var imageURLPath: String {
        guard URL(string: self) != nil else {
            return self
        }
        return APIBaseURLStore.baseURL + self
    }
    
    func imageUrl() -> URL? {
        let imageURL = URL(string: self)
        return imageURL
    }
    
    var asURL: URL? {
        return URL(string: self)
    }
    
    var canOpenApp: Bool {
        return UIApplication.shared.canOpenURL(self.asURL!)
    }
    
    var localized: String {
        return localized(withComment: "", withTableName: nil)
    }
    
    func localized(withTableName: String) -> String {
         return localized(withComment: "", withTableName: withTableName)
    }
    
    func localized(withComment: String, withTableName: String? = nil) -> String {
        return NSLocalizedString(self, tableName: withTableName, bundle: Bundle.main, value: "", comment: withComment)
    }
    
    //Non-optional bool
    public var boolValue: Bool {
            if ( ["true", "y", "t", "1", "200", "True"].contains(self)){
                return true
            } else {
                return false
        }
    }
    
    func attributedString(attributes: (fontName: String, size: Int, color: UIColor), link: (type: NSAttributedString.Key, values: String)? = nil) -> NSMutableAttributedString {
        let attString =  NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: UIFont(name: attributes.fontName, size: CGFloat(attributes.size))!, NSAttributedString.Key.foregroundColor: attributes.color])
        guard  link != nil else {
            return attString
        }
        attString.addAttribute(.link, value: link?.values ?? "", range: attString.mutableString.range(of: self))
        return attString
        
    }
    
    //Attributed String
    func attributedString1(font: UIFont, forgroundColor: UIColor) -> NSMutableAttributedString {
        
        return NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: forgroundColor])
    }
    
}
