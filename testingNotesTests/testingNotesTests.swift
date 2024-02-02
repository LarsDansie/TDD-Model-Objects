//
//  testingNotesTests.swift
//  testingNotesTests
//
//  Created by Lars Dansie on 1/29/24.
//

import XCTest
@testable import testingNotes

final class TestPerson: XCTestCase {

    var testPerson: Person?
    
    let expectedFirstName = "John"
    let expectedLastName = "Doe"
    var expectedAfraidOfCommitment = true
    var expectedAmountOfMoney = 10
//    let expectedAge = 17
    let expectedAge = 18
    
    override func setUpWithError() throws {
        self.testPerson = Person(
            firstName: expectedFirstName,
            lastName: expectedLastName,
            afraidOfCommitment: expectedAfraidOfCommitment,
            money: expectedAmountOfMoney,
            age: expectedAge
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPersonCreation() {
        XCTAssertNotNil(testPerson)
    }
    
    
    func testFirstName() {
        guard let testPerson else {
            XCTFail("No person")
            return
            }
        XCTAssertEqual(testPerson.firstName, expectedFirstName)
    }
    
    func testLastName() {
        guard let testPerson else {
            XCTFail("No person")
            return
            }
        XCTAssertEqual(testPerson.lastName, expectedLastName)
    }
    
    func testFullName() throws {
        guard let testPerson else {
            XCTFail("No person")
            return
            }
        let fullName = expectedFirstName + " " + expectedLastName
        XCTAssertEqual(testPerson.fullName, fullName)
    }
    
    func testEmotionalResponse() throws {
        guard let testPerson else {
            XCTFail("No person")
            return
            }
        XCTAssertTrue(testPerson.afraidOfCommitment)
        testPerson.seekTherapy()
        XCTAssertFalse(testPerson.afraidOfCommitment)
        testPerson.trauma()
        XCTAssertTrue(testPerson.afraidOfCommitment)
    }
    
    func testAdult() throws {
        guard let testPerson else {
            XCTFail("No person")
            return
            }
        let needToBeAbove = 17
        XCTAssertGreaterThan(testPerson.age, needToBeAbove)
    }
    
    func testCanBuyHouse() throws {
        guard let testPerson else {
            XCTFail("No person")
            return
            }
        let neededAmountForCardboardBox = 50
        // inflation is crazy in this realm
        XCTAssertGreaterThan(neededAmountForCardboardBox, testPerson.money)
        testPerson.getCashMoney()
        XCTAssertLessThan(neededAmountForCardboardBox, testPerson.money)
    }
}
