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
    
    override public func titleRect(forBounds rect: NSRect) -> NSRect {
        let sizingRect = NSRect(origin: NSPoint.zero, size: titleSize)
        if imagePosition == .imageRight {
            return frameForDrawingRect(sizingRect, inBounds: rect)
        } else {
            let imageFrame = imageRect(forBounds: rect)
            return frameForDrawingRect(sizingRect, relativeTo: imageFrame, inBounds: rect)
        }
    }
    
    override public func imageRect(forBounds rect: NSRect) -> NSRect {
        guard let image = image else { return NSRect.zero }
        let sizingRect = NSRect(origin: NSPoint.zero,
                                size: NSSize(width: image.size.width,
                                             height: image.size.height))
        if imagePosition == .imageLeft {
            return frameForDrawingRect(sizingRect, inBounds: rect)
        } else {
            let titleFrame = titleRect(forBounds: rect)
            return frameForDrawingRect(sizingRect, relativeTo: titleFrame, inBounds: rect)
        }
    }
    
    private func frameForDrawingRect(_ rect: NSRect,
                                     inBounds boundingRect: NSRect) -> NSRect {
        return CGRect(x: paddingLeft,
                      y: boundingRect.height / 2 - rect.height / 2,
                      width: rect.width,
                      height: rect.height)
    }
    
    private func frameForDrawingRect(_ primaryRect: NSRect,
                                     relativeTo otherRect: NSRect,
                                     inBounds boundingRect: NSRect) -> NSRect {
        let width = primaryRect.width
        let height = primaryRect.height
        let x = imageHugsTitle ?
            paddingLeft + otherRect.width + imageToTextPadding :
            boundingRect.width - paddingRight - width
        return CGRect(x: x,
                      y: boundingRect.height / 2 - height / 2,
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
