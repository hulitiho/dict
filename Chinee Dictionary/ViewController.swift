//
//  ViewController.swift
//  Chinee Dictionary
//
//  Created by Krime Loma on 6/27/20.
//  Copyright © 2020 Rakk Kiryl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SearchView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    var searching  = false
    private let imageArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"]
    private var searchArray = [String]()
  
    
    // MARK: - IBOUTLET
    @IBOutlet weak var imageBackground : UIImageView!
    
    
    @IBOutlet weak var tblView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       tblView.delegate = self
        tblView.dataSource = self
        
        let randomImage = imageArray.randomElement()
        imageBackground.image = UIImage(named: randomImage!)
        
    
    }
   


}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArray = imageArray.filter({$0.prefix(imageArray.count) == searchText})
        searching = true
        tblView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searching = false
        searchBar.text = ""
        tblView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchArray.count
        } else {
        return imageArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        if searching {
//            cell.textLabel?.text = searchArray[indexPath.row]
//
//        } else {
//            cell.textLabel?.text = imageArray[indexPath.row]
//
//        }
//        cell.backgroundColor = .white
         return cell
    }
    
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        }
}
