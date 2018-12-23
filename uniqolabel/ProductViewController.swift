//
//  ProductViewController.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 22/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!

    //MARK: VARS & LETS
    let products = ProductModelData().products
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    //MARK: CUSTOM FUNCTIONS
    func setupNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        self.navigationItem.title = Constants.shared().ProductVc_Title
    }
}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource DELEGATE FUNCTIONS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.shared().ProductVC_CellID) as! ProductCells
        
        cell.productImageView.image = products[indexPath.row].image
        cell.title.text = products[indexPath.row].title
        cell.detail.text = products[indexPath.row].details
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.shared().augmentedVCStoryBoardId) {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "ALERT!", message: Constants.shared().notImplementedString, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
