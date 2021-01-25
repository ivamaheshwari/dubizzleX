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
    
    var deatilViewModel : DetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

  
    // MARK: - Set up
    
    func setupUI(){
        self.navigationItem.title = "Detail View"
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
            self.lblTitle.text = deatilViewModel.name
            self.lblPrice.text = deatilViewModel.price
    }

}

extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deatilViewModel.imageCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailImageCell", for: indexPath) as? DetailCollectionViewCell else {
                fatalError("AddressCell cell is not found")
        }
        let productImage = self.deatilViewModel.imageUrl(index: indexPath.row)
        cell.imageURL = productImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return collectionView.bounds.size;
        }
    
    
}
