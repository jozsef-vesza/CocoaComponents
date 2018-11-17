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

    override func viewDidLoad() {
        super.viewDidLoad()
        paddedButton.layer?.cornerRadius = paddedButton.bounds.height / 2
    }
    
    @IBAction private func enabledToggleChanged(_ sender: NSButton) {
        flatButton.isEnabled = sender.state == .on
    }
}

