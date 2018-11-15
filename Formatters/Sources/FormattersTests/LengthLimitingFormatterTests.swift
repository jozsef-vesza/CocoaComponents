//
//  LengthLimitingFormatterTests.swift
//  FormattersTests
//
//  Created by József Vesza on 2018. 11. 15..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import XCTest
@testable import Formatters

class LengthLimitingFormatterTests: XCTestCase {
    var sut: LengthLimitingFormatter!
    
    override func setUp() {
        sut = LengthLimitingFormatter()
    }
    
    func testInvalidInputWhenTextIsLongerThanLimit() {
        sut.maxLength = 1
        var inputString: NSString = "long text"
        let input = AutoreleasingUnsafeMutablePointer<NSString>(UnsafeMutablePointer<NSString>(&inputString))
        var range = NSRange(location: 0, length: 0)
        let rangeInput = NSRangePointer(UnsafeMutablePointer<NSRange>(&range))
        let result = sut.isPartialStringValid(input,
                                              proposedSelectedRange: rangeInput,
                                              originalString: "",
                                              originalSelectedRange: NSRange(location: 0, length: 0),
                                              errorDescription: nil)
        XCTAssertFalse(result)
    }
    
    func testValidInputWhenTextIsShorterThanLimit() {
        sut.maxLength = 10
        var inputString: NSString = "long text"
        let input = AutoreleasingUnsafeMutablePointer<NSString>(UnsafeMutablePointer<NSString>(&inputString))
        var range = NSRange(location: 0, length: 0)
        let rangeInput = NSRangePointer(UnsafeMutablePointer<NSRange>(&range))
        let result = sut.isPartialStringValid(input,
                                              proposedSelectedRange: rangeInput,
                                              originalString: "",
                                              originalSelectedRange: NSRange(location: 0, length: 0),
                                              errorDescription: nil)
        XCTAssertTrue(result)
    }
    
    func testValidInputWhenTextIsEqualToLimit() {
        sut.maxLength = 9
        var inputString: NSString = "long text"
        let input = AutoreleasingUnsafeMutablePointer<NSString>(UnsafeMutablePointer<NSString>(&inputString))
        var range = NSRange(location: 0, length: 0)
        let rangeInput = NSRangePointer(UnsafeMutablePointer<NSRange>(&range))
        let result = sut.isPartialStringValid(input,
                                              proposedSelectedRange: rangeInput,
                                              originalString: "",
                                              originalSelectedRange: NSRange(location: 0, length: 0),
                                              errorDescription: nil)
        XCTAssertTrue(result)
    }
    
    func testReturnsValueWhenInputIsString() {
        let result = sut.string(for: "test")
        XCTAssertEqual(result, "test")
    }
    
    func testReturnsNilWhenInputIsNotString() {
        let result = sut.string(for: 1)
        XCTAssertNil(result)
    }
    
    func testReturnsStringAttributesWhenInputIsAttributedString() {
        let input = NSAttributedString(string: "test",
                                       attributes: [ .foregroundColor: NSColor.blue ])
        let result = sut.attributedString(for: input)?.attributes(at: 0, effectiveRange: nil)
        XCTAssertNotNil(result)
        XCTAssertEqual(result![.foregroundColor] as! NSColor, NSColor.blue)
    }
    
    func testReturnsNilAttributesWhenInputIsNotAttributedString() {
        let result = sut.attributedString(for: "test")
        XCTAssertNil(result)
    }
}
