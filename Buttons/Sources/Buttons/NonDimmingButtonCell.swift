//
//  NonDimmingButtonCell.swift
//  Buttons
//
//  Created by József Vesza on 2018. 11. 17..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

/// Custom `NSButtonCell` implementation to customize text appearance in disabled state
public class NonDimmingButtonCell: NSButtonCell {
    
    public var enabledTextColor: NSColor = .clear
    public var disabledTextColor: NSColor = .clear
    
    override public func drawTitle(_ title: NSAttributedString,
                                   withFrame frame: NSRect,
                                   in controlView: NSView) -> NSRect {
        
        guard let button = controlView as? NSButton else {
            return super.drawTitle(title, withFrame: frame, in: controlView)
        }
        
        var attributes = button.attributedTitle.attributes(at: 0, effectiveRange: nil)
        attributes[.foregroundColor] = isEnabled ? enabledTextColor : disabledTextColor
        let title = NSAttributedString(string: button.title, attributes: attributes)
        
        return super.drawTitle(title, withFrame: frame, in: controlView)
    }
}
