//
//  YSViewControllerTest.swift
//  YodaSpeak
//
//  Created by Varindra Hart on 1/20/16.
//  Copyright © 2016 Varindra Hart. All rights reserved.
//

import XCTest
import Alamofire
@testable import YodaSpeak


class YSViewControllerTest: XCTestCase {

    var testViewController = YSViewController()

    func testIsTextValid(){

        let shouldReturnFalse = testViewController.isTextValid("  ")
        XCTAssertFalse(shouldReturnFalse)

        let shouldReturnTrue = testViewController.isTextValid("this . is valid")
        XCTAssertTrue(shouldReturnTrue)

    }

}
