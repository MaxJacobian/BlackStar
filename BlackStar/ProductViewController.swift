//
//  ProductViewController.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    @IBOutlet var tableView: UITableView!
    
    var size: [String] = []
    var color: [String] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addOutlet.layer.cornerRadius = 7

    }
    
    @IBAction func add(_ sender: Any) {
        
        
        
    }
    
}
extension ProductViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return size.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductViewCell
        cell.color.text = "\(color[indexPath.row])"
        cell.size.text = "\(size[indexPath.row])"
        return cell
    }
    
    
}
