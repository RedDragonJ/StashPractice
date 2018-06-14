//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import XCTest
@testable import ZeplinPractice

class CalculatorTest: XCTestCase {
    
    func testCalculator() {
        let cal = Calculation()
        let result = cal.calculateProgress(5, 10)
        XCTAssertEqual(result, 0.5)
    }
}
