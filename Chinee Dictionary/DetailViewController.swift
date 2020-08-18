//
//  DetailViewController.swift
//  Chinee Dictionary
//
//  Created by Krime Loma on 7/2/20.
//  Copyright © 2020 Rakk Kiryl. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedCharacter : String!
    var selectedPinyin : String!
    var selectedDescription : String!
    var indexPath = IndexPath()
    var data = DictionaryDataFinal(character: "", pinyin: "", descriptions: "", isFavourite: false)
    
    @IBOutlet weak var charactedLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var pinyinLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var isFavouteOutletButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.overrideUserInterfaceStyle = .light
        charactedLabel.text = selectedCharacter
        pinyinLabel.text = selectedPinyin
        descriptionTextView.text = selectedDescription
    
        data.character = selectedCharacter ?? ""
        data.descriptions = selectedDescription ?? ""
        data.pinyin = selectedPinyin ?? ""
    }
    
    
    @IBAction func isFavouriteButton(_ sender: UIBarButtonItem) {
         isFavouteOutletButton.image = data.isFavourite ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
        data.isFavourite = !data.isFavourite
        
       
        
        print (data)
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    


}
