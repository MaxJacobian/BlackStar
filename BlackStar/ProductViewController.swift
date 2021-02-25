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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addOutlet.layer.cornerRadius = 7

    }
    
    @IBAction func add(_ sender: Any) {
        
    }
    
}
