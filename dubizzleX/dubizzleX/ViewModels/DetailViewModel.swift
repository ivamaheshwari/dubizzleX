//
//  File.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 25/01/21.
//

import Foundation

struct DetailViewModel {
    let name : String
    let price : String
    let imageURLs : [String]

    
    func imageCount() -> Int {
        return imageURLs.count
    }
    
    func imageUrl(index : Int) -> String{
        return imageURLs[index]
    }
    
}
