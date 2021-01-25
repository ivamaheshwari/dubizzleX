//
//  DetailViewController.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 25/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblPrice : UILabel!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var product : Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

  
    // MARK: - Set up
    
    func setupUI(){
        self.navigationItem.title = "Detail View"
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        if let product = product{
            self.lblTitle.text = product.name
            self.lblPrice.text = product.price
        }
    }

}

extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.product?.imageUrls.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailImageCell", for: indexPath) as? DetailCollectionViewCell else {
                fatalError("AddressCell cell is not found")
        }
        let productImage = self.product?.imageUrls[indexPath.row]
        cell.imageURL = productImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return collectionView.bounds.size;
        }
    
    
}
