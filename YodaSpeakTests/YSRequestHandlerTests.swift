//
//  YSRequestHandlerTests.swift
//  YodaSpeak
//
//  Created by Varindra Hart on 1/19/16.
//  Copyright © 2016 Varindra Hart. All rights reserved.
//

import XCTest
import Alamofire
@testable import YodaSpeak

class YSRequestHandlerTests: XCTestCase {

    let YSReqHandler = YSRequestHandler.init()
    var yodaString: String? = nil

    func testYodaSpeakForString(){

        let expectation = expectationWithDescription("asyncOperation")
        let testInput = "Hello this is a test of yoda speak"
        
        YSReqHandler.getYodaSpeakForString(testInput) {
            (yodaSpeakString:String) in

            self.yodaString = yodaSpeakString

            expectation.fulfill()
        }

        self.waitForExpectationsWithTimeout(5) {
            error in

            XCTAssert(self.yodaString != nil)

        }
    }

}
