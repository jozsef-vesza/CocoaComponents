//
//  FocusCheckingTextField.swift
//  InputFields
//
//  Created by József Vesza on 2018. 11. 25..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

/// Custom `NSTextField` subclass which updates its editing status when it becomes focused.
///
/// `FocusCheckingTextField` checks if the current window has assigned a field editor to it. If so, it's in focus.
///
public class FocusCheckingTextField: NSTextField {
    
    private(set) var isInFocus: Bool = false {
        didSet {
            /// `currentEditor()` gets queried frequently, but only change is important to the observer
            guard isInFocus != oldValue else {
                return
            }
            
            print("in focus: \(isInFocus)")
        }
    }
    
    override public func currentEditor() -> NSText? {
        let currentEditor = super.currentEditor()
        if currentEditor == nil {
            isInFocus = false
        } else {
            isInFocus = true
        }
        
        return currentEditor
    }
}
