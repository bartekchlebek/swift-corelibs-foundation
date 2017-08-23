// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//

#if DEPLOYMENT_RUNTIME_OBJC || os(Linux)
    import Foundation
    import XCTest
#else
    import SwiftFoundation
    import SwiftXCTest
#endif

class TestUnit: XCTestCase {
    
    static var allTests: [(String, (TestUnit) -> () throws -> Void)] {
        return [
            ("test_equality", test_equality),
        ]
    }
    
    func test_equality() {
        let u1 = Unit(symbol: "a")
        let u2 = Unit(symbol: "a")
        let u3 = Unit(symbol: "ab")

        XCTAssertEqual(u1, u2)
        XCTAssertEqual(u2, u1)
        XCTAssertNotEqual(u1, u3)
        XCTAssertNotEqual(u3, u1)

        let d1 = Dimension(symbol: "a", converter: UnitConverterLinear(coefficient: 1, constant: 2))
        let d2 = Dimension(symbol: "a", converter: UnitConverterLinear(coefficient: 1, constant: 2))
        let d3 = Dimension(symbol: "ab", converter: UnitConverterLinear(coefficient: 1, constant: 2))
        let d4 = Dimension(symbol: "a", converter: UnitConverterLinear(coefficient: 1, constant: 3))

        XCTAssertEqual(d1, d2)
        XCTAssertEqual(d2, d1)
        XCTAssertNotEqual(d1, d3)
        XCTAssertNotEqual(d3, d1)
        XCTAssertNotEqual(d1, d4)
        XCTAssertNotEqual(d4, d1)

        XCTAssertEqual(u1, d1)
        XCTAssertNotEqual(d1, u1)



//        XCTAssertEqual(Unit(symbol: "a"), Dimension(symbol: "a", converter: UnitConverter()))
//        XCTAssertNotEqual(Dimension(symbol: "a", converter: UnitConverter()), Unit(symbol: "a"))

    }
    
}
