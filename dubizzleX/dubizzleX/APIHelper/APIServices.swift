//
//  APIServices.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 23/01/21.
//

import Foundation

class APIService : NSObject,Requestable{
    
    static let instance = APIService()
    
    private let urlString =  "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
    
    var isLoadDataCalled : Bool = false
    var completeClosure : (([Product],Bool) -> ())!
    
    func apiToGetProductData(completion : @escaping ([Product],Bool) -> ()){
        
        self.isLoadDataCalled = true
        //        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
        //            if let data = data {
        //
        //                let jsonDecoder = JSONDecoder()
        //
        //                let productData = try! jsonDecoder.decode(Product.self, from: data)
        //                    completion(productData)
        //            }
        //        }.resume()
        
        request(method: .get, url: urlString, params: nil) { (result) in
            switch result {
            case .success(let data) :
                
                let productData = try? ProductResponce(data: data)
                let products = productData?.results ?? []
                completion(products,false)
                break
                
            case .failure(_):
                completion([Product](),true)
                break
            }
            
        }
        completeClosure = completion
    }
    
    func fetchSuccess() {
        completeClosure([Product](),false)
    }
    
    func fetchFail(error: Bool) {
        completeClosure([Product](),true)
    }
}
