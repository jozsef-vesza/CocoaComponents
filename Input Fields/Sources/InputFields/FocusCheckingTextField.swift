//
//  FocusCheckingTextField.swift
//  InputFields
//
//  Created by József Vesza on 2018. 11. 25..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

///
/// Custom `NSTextField` subclass which updates its editing status when it becomes focused.
///
/// Once in focus, `FocusCheckingTextField` will notify its delegate via `controlTextDidBeginEditing(_:)`
///
public class FocusCheckingTextField: NSTextField {
    
    private(set) var isInFocus: Bool = false {
        didSet {
            /// `currentEditor()` gets queried frequently, but only change is important to the observer
            guard isInFocus != oldValue, let fieldEditor = currentEditor() else {
                return
            }

            let notification = Notification(
                name: NSControl.textDidBeginEditingNotification,
                object: self,
                userInfo: [
                    "NSFieldEditor": fieldEditor
                ])
            
            textDidBeginEditing(notification)
        }
    }
    
    /// By default, `NSTextField` receives `textDidBeginEditing(_:)` once the user starts typing text,
    /// then it notifies its delegate about the editing status. `FocusCheckingTextFields` already
    /// notifies its delegate when it gets in focus, so this override is necessary to prevent duplicate notifications.
    public override func textDidBeginEditing(_ notification: Notification) {
        guard let sender = notification.object as? NSTextField, sender.stringValue == stringValue else { return }
        
        return super.textDidBeginEditing(notification)
    }
    
    /// `NSTextField` doesn't become the first responder once it gets focus. Instead it uses
    /// the window's field editor (shared between all the text fields in a given window).
    /// Once a text field has the field editor, it is certainly in focus.
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
