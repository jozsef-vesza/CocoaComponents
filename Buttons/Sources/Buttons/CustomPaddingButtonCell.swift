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
    @IBInspectable public var imageHugsTitle: Bool = false
    
    private var titleSize: NSSize {
        return NSSize(width: ceil(attributedTitle.size().width),
                      height: ceil(attributedTitle.size().height))
    }
    
    private var definingHeight: CGFloat {
        guard let image = image else {
            return titleSize.height
        }
        let imageHeight = image.size.height
        let titleHeight = titleSize.height
        
        return imageHeight > titleHeight ? imageHeight : titleHeight
    }
    
    public override func titleRect(forBounds rect: NSRect) -> NSRect {
        return CGRect(x: paddingLeft,
                      y: rect.height / 2 - titleSize.height / 2,
                      width: titleSize.width,
                      height: titleSize.height)
    }
    
    public override func imageRect(forBounds rect: NSRect) -> NSRect {
        guard let height = image?.size.height, let width = image?.size.width else { return CGRect.zero }
        let titleFrame = titleRect(forBounds: rect)
        let x = imageHugsTitle ?
            paddingLeft + titleFrame.width + imageToTextPadding :
            rect.width - paddingRight - width
        return CGRect(x: x,
                      y: rect.height / 2 - height / 2,
                      width: width,
                      height: height)
    }
    
    public override func cellSize(forBounds rect: NSRect) -> NSSize {
        let height = paddingTop + paddingBottom + definingHeight
        let width = paddingLeft + paddingRight +
            titleSize.width + imageToTextPadding + (image?.size.width ?? 0)
        
        return CGSize(width: width, height: height)
    }
}
