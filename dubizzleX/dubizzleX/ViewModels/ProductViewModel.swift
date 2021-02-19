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
    var products : [Article]? {
        didSet{
            isDidGetProductCalled = true
            self.didGetProduct!(true,false)
        }
    }
    
    override init() {
        super.init()
    }
    
    func loadProductData(){
        
        let API_KEY = "813a1033999e487a88ff64fffd0068e1"
        
        APIService.instance.apiToGetProductData(country: "us", key: API_KEY, completion: { (product,error)  in
            
            if !error {
                self.products = product
            }else{
                
            }
            
        })
    }
    
    func productViewModel(index : Int) -> ProductCellViewModel {
        let product = products![index]
        return.init(name: product.title , price: product.author ?? "" , imageURL: product.urlToImage ?? "", placeholder: "placeholder")
    }
    
    func productCount() -> Int {
        return products?.count ?? 0
    }
    
    func getDetailViewModel(index : Int) -> DetailViewModel {
        let product = products![index]
        return.init(title: product.title, source: product.source.name, author: product.author, detail: product.content, imageURL: product.urlToImage, date: product.publishedAt)
    }
}
