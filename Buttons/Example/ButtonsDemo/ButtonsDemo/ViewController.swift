//
//  ViewController.swift
//  ButtonsDemo
//
//  Created by József Vesza on 2018. 11. 17..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa
import Buttons

class ViewController: NSViewController {
    
    @IBOutlet private weak var flatButton: FlatButton!
    @IBOutlet private weak var paddedButton: FlatButton!
    @IBOutlet private weak var fixedWidthContraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        paddedButton.wantsLayer = true
        paddedButton.attributedTitle = NSAttributedString(
            string: "Padded Button",
            attributes: [.foregroundColor: NSColor.white]
        )
        paddedButton.layer?.backgroundColor = NSColor.blue.cgColor
        paddedButton.layer?.cornerRadius = paddedButton.bounds.height / 2
    }
    
    @IBAction private func enabledToggleChanged(_ sender: NSButton) {
        flatButton.isEnabled = sender.state == .on
    }
    
    @IBAction private func wideToggleChanged(_ sender: NSButton) {
        fixedWidthContraint.priority = sender.state == .on ? NSLayoutConstraint.Priority(rawValue: 900) : .defaultLow
    }
}

