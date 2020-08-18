//
//  ViewController.swift
//  Chinee Dictionary
//
//  Created by Krime Loma on 6/27/20.
//  Copyright © 2020 Rakk Kiryl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data = DataLoader().dictionaryDataFinal
    
    var searchArray = [DictionaryDataFinal]()
    var searching  = false
    var detailImage = ""

    private let imageArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"]
    
    // MARK: - IBOUTLET
    @IBOutlet weak var imageBackground : UIImageView!
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var SearchView: UIView!
    @IBOutlet weak var tblView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
        tblView.delegate = self
        tblView.dataSource = self
        searchBar.delegate = self
        
        let randomImage = imageArray.randomElement()
       
        imageBackground.image = UIImage(named: randomImage!)
        
        
    setNavigationBar()
    }
    
    
    @IBAction  func unwind (_ segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindData" else { return }
        
        guard let detail = segue.source as? DetailViewController else { return }
        let indexPath = detail.indexPath
        let isFavourite = detail.data.isFavourite
        data[indexPath.row].isFavourite = isFavourite
        
    }
    
    
    func  setNavigationBar () {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
    }


}

// MARK: - UISearchBarDelegate

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        searchArray = searchText.isEmpty ? data : data.filter{ $0.character.range(of: searchText, options: .caseInsensitive) != nil }
        searching = true
        tblView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource


extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            return searchArray.count
        } else {
            return data.count
        }
      
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        self.overrideUserInterfaceStyle = .light
        
  
        

        if searching {
            
            cell.characterLabel.text = searchArray[indexPath.row].character
            cell.descriprionLabel.text = searchArray[indexPath.row].descriptions
            
        } else {
            
            cell.characterLabel.text = data[indexPath.row].character
            cell.descriprionLabel.text = data[indexPath.row].descriptions
            
        }
        
         return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailSegue" else {return}
        guard let mainCharacter = segue.destination as? DetailViewController, let index = sender as? IndexPath else {return}
        guard let mainDescription = segue.destination as? DetailViewController else {return}
        guard let mainPinyin = segue.destination   as? DetailViewController else {return}
        guard let mainIndex = segue.destination   as? DetailViewController else {return}
       
        
        mainCharacter.selectedCharacter = data[index.row].character
        mainDescription.selectedDescription = data[index.row].descriptions
        mainPinyin.selectedPinyin = data[index.row].pinyin
        mainIndex.indexPath = index
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        }
}
