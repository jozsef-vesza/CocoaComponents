//
//  DateInputFormatterTests.swift
//  FormattersTests
//
//  Created by József Vesza on 2018. 11. 15..
//  Copyright © 2018. József Vesza. All rights reserved.
//

import XCTest
@testable import Formatters

class DateInputFormatterTests: XCTestCase {
    var sut: DateInputFormatter!
    
    override func setUp() {
        sut = DateInputFormatter()
        sut.dateFormat = "yyyy"
    }
    
    func testValidInputWhenDateStringMatchesFormat() {
        var inputString: NSString = "2018"
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
    
    func testInvalidInputWhenDateStringDoesntMatchFormat() {
        var inputString: NSString = "2018 Nov"
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
    
    func testReturnsDateStringWhenInputIsDate() {
        let result = sut.string(for: Date())
        XCTAssertNotNil(result)
    }
    
    func testReturnsNilWhenInputIsNotDate() {
        let result = sut.string(for: 2)
        XCTAssertNil(result)
    }
    
}
