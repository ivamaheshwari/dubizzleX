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
    @IBOutlet weak var view: UIView!
    
    var productViewModel : ProductCellViewModel? {
        didSet {
            if let product =  productViewModel{
                self.productName.text = product.name
                self.price.text = product.price
                productImage.setImage(withImageId: product.imageURL, placeholderImage: UIImage(named: product.placeholder)!)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.shadowRadius = 8
            view.layer.shadowOffset = CGSize(width: 3, height: 3)
            view.layer.shadowOpacity = 0.5
            view.layer.cornerRadius = 20
            view.translatesAutoresizingMaskIntoConstraints = false
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
    let imageURL : String
    let placeholder : String
    
    

}
