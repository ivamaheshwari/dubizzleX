//
//  File.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 25/01/21.
//

import Foundation

struct DetailViewModel {
    
    let title : String
    let source : String?
    let author: String?
    let detail: String?
    let imageURL: String?
    let date: Date
//    let content: String?
    
    func getDate() -> String{
        let fomater = DateFormatter()
        fomater.dateFormat = "dd MMM,yyyy hh:mm a"
        return fomater.string(from: date)
//        print(fomater.string(from: date))
    }
    
}
