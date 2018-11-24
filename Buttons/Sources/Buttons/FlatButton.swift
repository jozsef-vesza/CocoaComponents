//
//  FlatButton.swift
//  Buttons
//
//  Created by József Vesza on 2018. 11. 17..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

/// Easy-to-use `NSButton` subclass to support flat appearance
public class FlatButton: NSButton {
    // MARK: - Customizable view properties
    @IBInspectable public var backgroundColor: NSColor = .clear {
        didSet {
            layer?.backgroundColor = backgroundColor.cgColor
        }
    }
    
    @IBInspectable public var disabledBackgroundColor: NSColor = .clear
    
    @IBInspectable public var disabledBorderColor: NSColor = .clear
    
    @IBInspectable public var enabledTextColor: NSColor = .clear {
        didSet {
            updateCell()
        }
    }
    @IBInspectable public var disabledTextColor: NSColor = .clear {
        didSet {
            updateCell()
        }
    }
    
    @IBInspectable public var borderColor: NSColor = .clear {
        didSet {
            updateBorder()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            updateBorder()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer?.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - Toggles
    override public var isEnabled: Bool {
        didSet {
            updateBackground()
            updateBorder()
        }
    }
    
    // MARK: - Init
    override public init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Helpers
    private func setup() {
        wantsLayer = true
        cell = NonDimmingButtonCell()
        updateCell()
    }
    
    private func updateBackground() {
        layer?.backgroundColor = (isEnabled ? backgroundColor : disabledBackgroundColor).cgColor
    }
    
    private func updateBorder() {
        layer?.borderWidth = borderWidth
        layer?.borderColor = isEnabled ? borderColor.cgColor : disabledBorderColor.cgColor
    }
    
    private func updateCell() {
        guard let cell = cell as? NonDimmingButtonCell else { return }
        cell.enabledTextColor = enabledTextColor
        cell.disabledTextColor = disabledTextColor
        cell.bezelStyle = .shadowlessSquare
    }
}
