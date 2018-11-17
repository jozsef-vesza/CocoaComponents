//
//  CustomPaddingButtonCell.swift
//  Buttons
//
//  Created by József Vesza on 2018. 11. 17..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import Cocoa

/// Custom `NSButtonCell` implementation to customize the content padding within the button
public class CustomPaddingButtonCell: NSButtonCell {
    @IBInspectable public var paddingLeft: CGFloat = 0
    @IBInspectable public var paddingTop: CGFloat = 0
    @IBInspectable public var paddingBottom: CGFloat = 0
    @IBInspectable public var paddingRight: CGFloat = 0
    @IBInspectable public var imageToTextPadding: CGFloat = 0
    
    private var definingHeight: CGFloat {
        guard let image = image else {
            return attributedTitle.size().height
        }
        let imageHeight = image.size.height
        let titleHeight = attributedTitle.size().height
        
        return imageHeight > titleHeight ? imageHeight : titleHeight
    }
    
    public override func titleRect(forBounds rect: NSRect) -> NSRect {
        let height = attributedTitle.size().height
        return CGRect(x: paddingLeft,
                      y: rect.height / 2 - height / 2,
                      width: attributedTitle.size().width,
                      height: height)
    }
    
    public override func imageRect(forBounds rect: NSRect) -> NSRect {
        guard let height = image?.size.height, let width = image?.size.width else { return CGRect.zero }
        return CGRect(x: rect.width - paddingRight - width,
                      y: rect.height / 2 - height / 2,
                      width: width,
                      height: height)
    }
    
    public override func cellSize(forBounds rect: NSRect) -> NSSize {
        let height = paddingTop + paddingBottom + definingHeight
        let width = paddingLeft + paddingRight + attributedTitle.size().width + imageToTextPadding + (image?.size.width ?? 0)
        
        return CGSize(width: width, height: height)
    }
}
