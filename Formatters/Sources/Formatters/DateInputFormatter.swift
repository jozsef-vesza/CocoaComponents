//
//  DateInputFormatter.swift
//  FormattersTests
//
//  Created by József Vesza on 2018. 11. 15..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

public final class DateInputFormatter: Formatter {
    public var dateFormat: String = "" {
        didSet {
            dateFormatter.dateFormat = dateFormat
        }
    }
    private let dateFormatter = DateFormatter()
    
    override public func string(for obj: Any?) -> String? {
        guard let dateValue = obj as? Date else {
            return nil
        }
        
        return dateFormatter.string(from: dateValue)
    }
    
    override public func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
                                        for string: String,
                                        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = dateFormatter.date(from: string) as NSDate?
        return true
    }
    
    override public func isPartialStringValid(_ partialStringPtr: AutoreleasingUnsafeMutablePointer<NSString>,
                                              proposedSelectedRange proposedSelRangePtr: NSRangePointer?,
                                              originalString origString: String,
                                              originalSelectedRange origSelRange: NSRange,
                                              errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        return dateFormatter.date(from: partialStringPtr.pointee as String) != nil
    }
}
