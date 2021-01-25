//
//  ProductViewController.swift
//  dubizzleX
//
//  Created by Iva Maheshwari on 23/01/21.
//

import UIKit

class ProductViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    let viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setupData()
        fetctProductData()
        
        // Do any additional setup after loading the view.
    }
    
    func setupData(){
        self.navigationItem.title = "Products"
    }

    // MARK: - UI
    func setUI(){
        prepareTableView()
        prepareViewModelObserver()
    }

    func prepareTableView(){
        self.view.backgroundColor = .white
        self.tableview.separatorStyle = .none
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.accessibilityIdentifier = "productTableView"
        self.tableview.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellReuseIdentifier: "ProductViewCell")
    }

}
//MARK: - Fetch Products
extension ProductViewController {
    
    func fetctProductData(){
        viewModel.loadProductData()
    }
    
    func prepareViewModelObserver(){
        self.viewModel.didGetProduct = {(complete,error) in
            print(complete,error)
            if !error{
                self.tableview.reloadData()
            }else{
                let alert = UIAlertController(title: "dubizzleX", message: "Something went wrong, try again later", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

extension ProductViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ProductViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath as IndexPath) as? ProductViewCell else {
            fatalError("AddressCell cell is not found")
        }
        
        let product = viewModel.productViewModel(index: indexPath.row)
        cell.productViewModel = product
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableView.automaticDimension
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.deatilViewModel = viewModel.getDetailViewModel(index: indexPath.row)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
//
    
}
