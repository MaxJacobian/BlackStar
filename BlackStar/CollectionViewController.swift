//
//  CollectionViewController.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import UIKit

private let reuseIdentifier = "ProductCell"

class CollectionViewController: UICollectionViewController, ProductProtocol {
 
    var id = Int()
    var product: Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            let loader = ProductModel(id: 217)
            loader.delegate = self
            loader.loadedProduct()
    }
    
    func getProduct(product: Product) {
        self.product = product
        DispatchQueue.main.async {
          
            self.collectionView.reloadData()
        }
    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return product?.count ?? 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath)  as! CollectionViewCell
        cell.name.text =  "\(product?.map{_,value in value.name}[indexPath.row] ?? "")"
        cell.price.text = "\(product?.map{_,value in value.price}[indexPath.row] ?? "") руб."
        cell.image.downloadedFrom(link: "https://blackstarshop.ru/\(product?.map({_,value in   value.productImages.first?.imageURL})[indexPath.row] ?? "")")
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell, let index = collectionView.indexPath(for: cell) {
            guard segue.identifier == "Third" else { return }
            guard let vc = segue.destination as? ProductViewController else { return }
            if let product = product {
                DispatchQueue.main.async {
                    vc.name?.text =  product.map{_, value in value.name}[index.row]
                    vc.price?.text = product.map{_, value in value.price}[index.row] + " " + "руб."
                    vc.descriptionLabel?.text = product.map{_, value in value.productDescription}[index.row]
                    vc.image?.downloadedFrom(link: "https://blackstarshop.ru/\(product.map({_,value in   value.productImages.first?.imageURL})[index.row] ?? "")")
                }
            }
        }
    }
}
extension UIImageView {
  
  func downloadedFrom(link:String) {
   guard let url = URL(string: link) else { return }
   URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
     guard let data = data , error == nil, let image = UIImage(data: data) else { return }
     DispatchQueue.main.async { () -> Void in
       self.image = image
     }
   }).resume()
 }
 
}
