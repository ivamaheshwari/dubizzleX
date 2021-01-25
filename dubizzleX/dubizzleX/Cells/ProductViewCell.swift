//
//  ProductViewCell.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 23/01/21.
//

import UIKit

class ProductViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var productViewModel : ProductCellViewModel? {
        didSet {
            if let product =  productViewModel{
                self.productName.text = product.name
                self.price.text = product.price
                productImage.setImage(withImageId: product.imageURL[0], placeholderImage: UIImage(named: product.placeholder)!)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

struct  ProductCellViewModel{
    let name : String
    let price : String
    let imageURL : [String]
    let placeholder : String

}
