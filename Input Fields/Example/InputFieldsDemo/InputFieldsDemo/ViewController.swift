//
//  ViewController.swift
//  InputFieldsDemo
//
//  Created by József Vesza on 2018. 11. 25..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa
import InputFields

class ViewController: NSViewController {
    
    @IBOutlet private weak var focusCheckingTextField: FocusCheckingTextField!
    @IBOutlet private weak var regularTextField: NSTextField!
    @IBOutlet private weak var secureTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        focusCheckingTextField.delegate = self
        regularTextField.delegate = self
    }
    
    @IBAction private func showPasswordToggleChanged(_ sender: NSButton) {
        secureTextField.isSecure = sender.state != .on
    }
}

extension ViewController: NSTextFieldDelegate {
    func controlTextDidBeginEditing(_ obj: Notification) {
        guard let sender = obj.object as? NSTextField else { return }
        if sender == focusCheckingTextField {
            print("focus checking text field editing")
        } else {
            print("regular text field editing")
        }
    }
}
