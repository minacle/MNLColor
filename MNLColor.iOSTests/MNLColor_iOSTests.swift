//
//  MNLColor_iOSTests.swift
//  MNLColor.iOSTests
//
//  Created by Mayu Laierlence on 2018. 8. 30..
//

import XCTest

@testable
import MNLColor

class MNLColor_iOSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMonochrome() {
        guard let color = MNLColor(white: 0.5, alpha: 1.0) else {
            XCTFail()
            return
        }
        var components = MNLMonochromeColorComponents()
        color.monochromeColorComponents(&components)
        XCTAssertEqual(components.white, 0.5)
        XCTAssertEqual(components.alpha, 1.0)
    }

    func testRGB() {
        guard let color = MNLColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 0.8) else {
            XCTFail()
            return
        }
        var components = MNLRGBColorComponents()
        color.rgbColorComponents(&components)
        XCTAssertEqual(components.red, 0.2)
        XCTAssertEqual(components.green, 0.4)
        XCTAssertEqual(components.blue, 0.6)
        XCTAssertEqual(components.alpha, 0.8)
    }

    func testCMYK() {
        guard let color = MNLColor(cyan: 0.1, magenta: 0.3, yellow: 0.5, black: 0.7, alpha: 0.9) else {
            XCTFail()
            return
        }
        var components = MNLCMYKColorComponents()
        color.cmykColorComponents(&components)
        XCTAssertEqual(components.cyan, 0.1)
        XCTAssertEqual(components.magenta, 0.3)
        XCTAssertEqual(components.yellow, 0.5)
        XCTAssertEqual(components.black, 0.7)
        XCTAssertEqual(components.alpha, 0.9)
    }
}
