//
//  SecureTextField.swift
//  InputFields
//
//  Created by József Vesza on 2018. 11. 25..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

public extension NSTextField {
    @IBInspectable public var isSecure: Bool {
        get {
            return (cell as? NSSecureTextFieldCell) != nil
        }
        set {
            guard newValue != isSecure else { return }
            
            let selection = currentEditor()?.selectedRange
            let newCell = newValue ? NSSecureTextFieldCell() : NSTextFieldCell()
            
            updateCell(newCell)
            restoreSelection(selectedRange: selection)
            resumeEditingIfNeeded()
        }
    }
    
    private func updateCell(_ newCell: NSTextFieldCell) {
        if let placeholderAttributedString = placeholderAttributedString {
            newCell.placeholderAttributedString = placeholderAttributedString
        } else {
            newCell.placeholderString = placeholderString
        }
        
        if allowsEditingTextAttributes {
            newCell.attributedStringValue = attributedStringValue
        } else {
            newCell.stringValue = stringValue
        }
        
        newCell.stringValue = stringValue
        newCell.isSelectable = isSelectable
        newCell.isEditable = isEditable
        newCell.isBezeled = isBezeled
        newCell.bezelStyle = bezelStyle
        newCell.font = font
        
        cell = newCell
        
        needsDisplay = true
    }
    
    private func restoreSelection(selectedRange: NSRange?) {
        if let selectedRange = selectedRange {
            window?.makeFirstResponder(self)
            currentEditor()?.selectedRange = selectedRange
        }
    }
    
    private func resumeEditingIfNeeded() {
        let fieldEditor = window?.firstResponder as? NSTextView
        
        let isFieldEditorActive = fieldEditor?.isKind(of: NSTextField.self) ?? false
        let fieldEditorIsSelf = fieldEditor?.delegate?.isKind(of: NSTextField.self) ?? false
        
        if isFieldEditorActive && fieldEditorIsSelf {
            window?.makeFirstResponder(self)
        }
    }
}
