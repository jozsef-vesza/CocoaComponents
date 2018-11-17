//
//  CustomPaddingButton.swift
//  Buttons
//
//  Created by József Vesza on 2018. 11. 17..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

public class CustomPaddingButton: NSButton {
    override public var intrinsicContentSize: NSSize {
        guard let cell = cell as? CustomPaddingButtonCell else {
            return super.intrinsicContentSize
        }
        
        return cell.cellSize(forBounds: bounds)
    }
}
