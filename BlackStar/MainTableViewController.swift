//
//  MainTableViewController.swift
//  BlackStar
//
//  Created by Maksym on 25.02.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = Model()
        loader.delegate = self
        loader.loadedCategory()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell) {
            guard segue.identifier == "First" else { return }
            guard let vc = segue.destination as? SubcategoryTableViewController else { return }
            
            vc.subcategory = category?.map{_,value in value.subcategories}[index.row]

        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return category?.count ?? 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath) as! MainTableViewCell
        cell.picture.layer.cornerRadius = 10
    
        if let category = category {
            
      
            cell.picture.downloadedFrom(link: "https://blackstarshop.ru/\(category.map{_, value in value.image}[indexPath.row])")
            cell.labelText.text = "\(category.map{_, value in value.name}[indexPath.row])"

        }
        return cell
    }
}

extension MainTableViewController: CategoryProtocol{
    func getCategory(category: Category) {
        self.category = category
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
