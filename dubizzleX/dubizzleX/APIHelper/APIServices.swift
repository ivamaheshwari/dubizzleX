//
//  APIServices.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 23/01/21.
//

import Foundation

class APIService : NSObject,Requestable{
    
    static let instance = APIService()
    
    private let urlString =  "https://newsapi.org/v2/top-headlines"
    
    var isLoadDataCalled : Bool = false
    var completeClosure : (([Article],Bool) -> ())!
    
    func apiToGetProductData(country : String,key : String,completion : @escaping ([Article],Bool) -> ()){
        
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
        let queryItems = [URLQueryItem(name: "country", value: country), URLQueryItem(name: "apiKey", value: key)]
        var urlComponent = URLComponents(string: urlString)
        urlComponent?.queryItems = queryItems
        
        guard let url = urlComponent?.url else{
            return
        }
        
        request(method: .get, url: url, params: nil) { (result) in
            switch result {
            case .success(let data) :
                print("Here",data)
                let productData = try? News(data: data)
                let products = productData?.articles ?? []
                completion(products,false)
                break
                
            case .failure(_):
                completion([Article](),true)
                break
            }
            
        }
        completeClosure = completion
    }
    
    func fetchSuccess() {
        completeClosure([Article](),false)
    }
    
    func fetchFail(error: Bool) {
        completeClosure([Article](),true)
    }
}
