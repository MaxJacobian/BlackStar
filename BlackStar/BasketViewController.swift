//
//  BasketViewController.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import UIKit

class BasketViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basket", for: indexPath) as! BasketViewCell
        cell.name.text = "Худи"
        cell.color.text = "white"
        cell.price.text = "2000"


        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Basket", for: indexPath) as! BasketViewCell
//        cell.delete.addTarget(self, action: #selector(remove), for: .touchUpInside)
//    }
//    
//    @objc func remove(){
//        print("Hello")
//        
//    }

}
