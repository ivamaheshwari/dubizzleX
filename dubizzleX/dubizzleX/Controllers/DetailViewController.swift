//
//  DetailViewController.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 25/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblAuthor : UILabel!
    @IBOutlet weak var lblDate : UILabel!
//    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var imagVw : UIImageView!
    @IBOutlet weak var txtView : UITextView!
    
    
    var deatilViewModel : DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Set up
    
    func setupUI(){
        self.navigationItem.title = "Detail View"
        //        self.collectionView.dataSource = self
        //        self.collectionView.delegate = self
        self.lblTitle.text = deatilViewModel.title
        self.lblAuthor.text = deatilViewModel.author
        self.lblDate.text = deatilViewModel.getDate()
        self.txtView.text = deatilViewModel.detail
        
        if let imageUrl = deatilViewModel.imageURL{
            imagVw.setImage(withImageId: imageUrl, placeholderImage: UIImage(named: "placeholder")!)
        }else{
            imagVw.image = UIImage(named: "placeholder")
        }
        
        //        self.imageVw.image = deatilViewModel.image
        
    }
    
}

//extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return deatilViewModel.imageCount()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailImageCell", for: indexPath) as? DetailCollectionViewCell else {
//                fatalError("AddressCell cell is not found")
//        }
//        let productImage = self.deatilViewModel.imageUrl(index: indexPath.row)
//        cell.imageURL = productImage
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return collectionView.bounds.size;
//        }
//
//
//}
