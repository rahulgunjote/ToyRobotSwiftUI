//
//  ToyRobotTests.swift
//  ToyRobotTests
//
//  Created by Rahul Gunjote on 2/2/2022.
//

import XCTest
@testable import ToyRobot

class ToyRobotTests: XCTestCase {
    
    var sut: RobotViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RobotViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testReportWithStaticData() throws {
        sut.placeRobot(xPoint: 4, yPoint: 5, direction: .east)
        XCTAssertEqual(4, sut.column)
        XCTAssertEqual(5, sut.row)
        XCTAssertEqual(Direction.east, sut.direction)
        
        sut.placeRobot(xPoint: 1, yPoint: 2, direction: .south)
        XCTAssertEqual(1, sut.column)
        XCTAssertEqual(2, sut.row)
        XCTAssertEqual(Direction.south, sut.direction)

    }
    
    func testWhenTurnLeftAndMove() throws {
        
        sut.placeRobot(xPoint: 2, yPoint: 2, direction: .east)
        sut.processCommand(.left)
        sut.processCommand(.move)
        sut.processCommand(.move)
        XCTAssertEqual(4, sut.row)
        XCTAssertEqual(2, sut.column)
        XCTAssertEqual(Direction.north, sut.direction)

    }
    
    func testWhenTurnRightAndMove() throws {
        
        sut.placeRobot(xPoint: 2, yPoint: 2, direction: .east)
        sut.processCommand(.right)
        sut.processCommand(.move)
        sut.processCommand(.move)
        XCTAssertEqual(0, sut.row)
        XCTAssertEqual(2, sut.column)
        XCTAssertEqual(Direction.south, sut.direction)
    }
    
    func testWhenOutOfRange() throws {
        sut.placeRobot(xPoint: 0, yPoint:0, direction: .south)
        sut.processCommand(.move)
        XCTAssertEqual(sut.isWrongAttempt, true)
    }
    
    func testReport() throws {
        
        sut.placeRobot(xPoint: 2, yPoint: 2, direction: .east)
        sut.processCommand(.left)
        sut.processCommand(.move)
        sut.processCommand(.move)
        XCTAssertEqual(4, sut.row)
        XCTAssertEqual(2, sut.column)
        XCTAssertEqual("4, 2, NORTH", sut.report)
        
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
