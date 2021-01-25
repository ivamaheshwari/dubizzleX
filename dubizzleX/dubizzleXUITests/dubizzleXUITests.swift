//
//  dubizzleXUITests.swift
//  dubizzleXUITests
//
//  Created by Iva Maheshwari on 24/01/21.
//

import XCTest
@testable import dubizzleX

class dubizzleXUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        self.vc = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController
//        self.vc.loadView()
//        self.vc.viewDidLoad()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

       
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func test_tableview(){
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        
        
        let producttableviewTable = XCUIApplication()/*@START_MENU_TOKEN@*/.tables["productTableView"]/*[[".tables[\"Empty list\"]",".tables[\"productTableView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let cell = producttableviewTable.firstMatch
        XCTAssertNotNil(producttableviewTable)
//        XCTAssertTrue(cell)
        cell.tap()
    }
}
