//
//  ProductViewModel.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 23/01/21.
//

import Foundation
    
class ProductViewModel: NSObject {
    
    var isDidGetProductCalled : Bool = false
    
    var didGetProduct : ((Bool,Bool) -> Void)?
    var products : [Product]? {
        didSet{
            isDidGetProductCalled = true
            self.didGetProduct!(true,false)
        }
    }
    
    override init() {
        super.init()
    }
    
    func loadProductData(){
        
        APIService.instance.apiToGetProductData { (product,error)  in
            
            if !error {
                self.products = product
            }else{
                
            }
            
        }
    }
}
