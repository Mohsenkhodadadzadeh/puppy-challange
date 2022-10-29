//
//  puppy_challangeTests.swift
//  puppy challangeTests
//
//  Created by Mohsen on 10/26/22.
//

import XCTest

@testable import puppy_challange

class puppy_challangeTests: XCTestCase {

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

    func testReceiveData() throws {
        let testPetViewModel = PetTypeView.ViewModel()
        
        testPetViewModel.rawModel.numberOfNightsHotelForCat = 3
        testPetViewModel.rawModel.numberOfNightsHotelForDog = 1
        testPetViewModel.rawModel.groomyCat = true
        testPetViewModel.waitingForResponseFromEndpoint = false
        let expectation = self.expectation(description: "wait for response")
        
        testPetViewModel.calculate() //{ obj in
        var resultStatus: Bool = false
        testPetViewModel.calculatingResult = { status in
            expectation.fulfill()
            resultStatus = status
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        if resultStatus {
            XCTAssertEqual(testPetViewModel.responseMessageBody, "total price is : 750")
        }
        
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
