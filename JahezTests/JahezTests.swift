//
//  JahezTests.swift
//  JahezTests
//
//  Created by abdulkarim on 02/03/2022.
//

import XCTest
@testable import Jahez

class JahezTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewModel(){
        
        let details = ResturantElement(id: 4, name: "Pizzaratti", resturantElementDescription: "Enjoy fast delivery from Jahez. Order now, or schedule your order any time you want", hours: "12:00 PM - 03:30 AM", image: "https://jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com/4.jpg", rating: 8, distance: 1.9865785830705502, hasOffer: false, offer: Offer(rawValue: "9 Ø±ÙŠØ§Ù„"))
        
        let Details = Details(details: details)
        
        XCTAssertEqual(details.hours, Details.hours)
        
        
        
        
    }

}
