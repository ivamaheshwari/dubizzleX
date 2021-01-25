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
    
    func productViewModel(index : Int) -> ProductCellViewModel {
        let product = products![index]
        return.init(name: product.name, price: product.price, imageURL: product.imageUrlsThumbnails, placeholder: "placeholder")
    }
    
    func productCount() -> Int {
        return products?.count ?? 0
    }
    
    func getDetailViewModel(index : Int) -> DetailViewModel {
        let product = products![index]
        return.init(name: product.name, price: product.price, imageURLs: product.imageUrls)
    }
}
