//
//  ProductModelTest.swift
//  dubizzleXTests
//
//  Created by Iva Maheshwari on 24/01/21.
//

import XCTest
@testable import dubizzleX

class ProductModelTest: XCTestCase {
    
    var sut : [Product]!

    override func setUpWithError() throws {
        super.setUp()
        let data = try getData(fromJSON: "ProductData")
        sut = try ProductResponce(data: data).results
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFirstProduct(){
        let productFirst = sut.first!
        XCTAssertEqual(productFirst.name, "Notebook")
        XCTAssertEqual(productFirst.price, "AED 5")
        XCTAssertEqual(productFirst.imageUrlsThumbnails[0], "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4Z77HC5FE&Signature=8RmUifwVfeTdnanCH2XO%2BWixt%2BU%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEAMaCXVzLWVhc3QtMSJHMEUCIDZ9pAuxqAsDByy8tBuawFPbw44495Lvkgnu4Cnkh2DWAiEAjXRbQZC8Ghewl%2Ffi7U845EZ4icFvhYXgtc0CkZ9C0wUq1wEI3P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARACGgwxODQzOTg5NjY4NDEiDFEacfJgtCgKpn57giqrAU2l%2BCVi0lE96MnBXeOYNLJWC8HpmpYZ7NIOXyiuMxbq3HamgwN0UmK6VzeiMc9Ap1wFWsp2zfP0MEBLZeS4DsxlgxSFEYssWI75%2FS%2BwZT8Y%2B8wi0tTnu0p9i9YBLTaJF5L3jpcx5LasVHVYjqswH9Hg5eL8Xlr592Jnsbvk0epLb7VVvLpcX7ZMSiaWksRJ%2FdL6fKqsU8dtDRncmFsZvStaL1%2F0luVDMdmUijDo37GABjrgAfzlp1%2BG0b3E7NBm0VMIMrLBvqy4NASh%2FQ2c4vR23KIoDd3Qp8qMNzGqQAcvJhYegrr8HWhI5I3197eSjl7xVfJHc2odPH8PFsAeTB3JdUYrA7ZVbDuQ3URZ3BvynCcAIbdBITZxzN0uyr4dga01TSBPmToVCQZQ3F41INNzlmFw2djEylMlnGw8bkbyF%2B1eF552Rs8v%2BsiwRQ57Z%2B9lJScNq2zy7ce06D24vW1gm8mFAeTxF8bsFOp9FGikvl4RFjBt7f6Wsx48Cs0j8hXR%2Bkhw%2BogLplXnts0LHbsuKYWq&Expires=1611431418")
        
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
