//
//  LengthLimitingFormatter.swift
//  Formatters
//
//  Created by József Vesza on 2018. 11. 15..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

public final class LengthLimitingFormatter: Formatter {
    public var maxLength = Int.max
    
    override public func string(for obj: Any?) -> String? {
        guard let stringValue = obj as? String else {
            return nil
        }
        
        return stringValue
    }
    
    override public func attributedString(for obj: Any,
                                          withDefaultAttributes attrs: [NSAttributedString.Key: Any]? = nil) -> NSAttributedString? {
        guard let attributedString = obj as? NSAttributedString else {
            return nil
        }
        return attributedString
    }
    
    override public func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
                                        for string: String,
                                        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as NSString
        return true
    }
    
    override public func isPartialStringValid(_ partialStringPtr: AutoreleasingUnsafeMutablePointer<NSString>,
                                              proposedSelectedRange proposedSelRangePtr: NSRangePointer?,
                                              originalString origString: String,
                                              originalSelectedRange origSelRange: NSRange,
                                              errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        return partialStringPtr.pointee.length <= maxLength
    }
}

