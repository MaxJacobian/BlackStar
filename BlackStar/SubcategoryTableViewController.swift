//
//  SubcategoryTableViewController.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import UIKit

class SubcategoryTableViewController: UITableViewController {
    
    var subcategory: [Subcategory]?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell) {
            guard segue.identifier == "Second" else { return }
            guard let vc = segue.destination as? CollectionViewController else { return }
            if let subcategory = subcategory {
                
                
               
                
                
//                vc.id = subcategory[index.row].id.encode(to: SortOrder.integer(id))
//                    subcategory[index.row].sortOrder.encode(to: SortOrder.integer(<#T##Int#>))
            
            }
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subcategory?.count ?? 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subcategory", for: indexPath)
        cell.textLabel?.text = "\(subcategory?[indexPath.row].name ?? "")"
        return cell
    }
 

}
