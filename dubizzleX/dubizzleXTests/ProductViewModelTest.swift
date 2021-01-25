//
//  ProductViewModelTest.swift
//  dubizzleXTests
//
//  Created by Iva Maheshwari on 24/01/21.
//

import XCTest
@testable import dubizzleX

class ProductViewModelTest: XCTestCase {
    
    var sut : ProductViewModel!
    var data : Data!
    var products : ProductResponce!
    
    override func setUp() {
        super.setUp()
        sut = ProductViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_product(){
        sut.loadProductData()
        //Assert
        XCTAssert(APIService.instance.isLoadDataCalled)
    }
    
    
    func test_observer(){
        APIService.instance.apiToGetProductData { [self] (result,error)  in
            XCTAssert(sut.isDidGetProductCalled)
        }
       // XCTAssert(sut.isDidGetProductCalled)
    }
    
//    func test_ObserverCompletion(){
//        //when
//        sut.loadProductData()
//
//
//    }
    
    func test_apiGetProductData(){
        let exp = expectation(description: "Load Product")
        APIService.instance.apiToGetProductData { (result,error)  in
            if !error{
                XCTAssertEqual(result.count,self.products.results.count)
            }else{
              //  XCTAssertEqual(error,true)
                XCTFail()
            }
            exp.fulfill()
//            switch result {
//            case .success(let success) :
//                print ("success:", success)
//                XCTAssertEqual(success, data.data(using: .utf8))
//            case .failure(_):
//                XCTFail()
//            }
//            exp.fulfill()
        }
        waitForExpectations(timeout:  50.0)
    }
    
    
    
    override func setUpWithError() throws {
        
        
        data = try getData(fromJSON: "ProductData")
        products = try JSONDecoder().decode(ProductResponce.self, from: data)
            
//            ProductResponce(data: data)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
