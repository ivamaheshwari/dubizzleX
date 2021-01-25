//
//  DetailCollectionViewCell.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 25/01/21.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagVw : UIImageView!
    
    var imageURL : String?{
        didSet{
            if let imageUrl = imageURL{
                imagVw.setImage(withImageId: imageUrl, placeholderImage: UIImage(named: "placeholder")!)
            }
        }
    }
    
}
