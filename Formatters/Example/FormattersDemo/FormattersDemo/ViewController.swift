//
//  ViewController.swift
//  FormattersDemo
//
//  Created by József Vesza on 2018. 11. 15..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa
import Formatters

class ViewController: NSViewController {
    
    @IBOutlet private weak var inputField: NSTextField!
    @IBOutlet private weak var dateInputField: NSTextField!
    private let formatter = LengthLimitingFormatter()
    private let dateInputFormatter = DateInputFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.formatter = formatter
        dateInputFormatter.dateFormat = "MMM"
        dateInputField.formatter = dateInputFormatter
    }
    
    @IBAction private func valueChanged(_ sender: NSTextField) {
        guard let newValue = Int(sender.stringValue) else { return }
        formatter.maxLength = newValue
    }
    
    @IBAction private func pasteButtonPressed(_ sender: NSButton) {
        dateInputField.stringValue = "Nov"
    }
}

