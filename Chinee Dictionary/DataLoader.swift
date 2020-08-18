//
//  DataLoader.swift
//  Chinee Dictionary
//
//  Created by Krime Loma on 7/11/20.
//  Copyright © 2020 Rakk Kiryl. All rights reserved.
//

import Foundation

public class DataLoader {
   @Published var dictionaryData = [DictionaryData]()
    @Published var dictionaryDataFinal = [DictionaryDataFinal]()
    init() {
        load()
        sort()
        convert()
    }
    
    func load() {
        
        if let fileLocation1 = Bundle.main.url(forResource: "v83.1", withExtension: "json")
//            let fileLocation2 = Bundle.main.url(forResource: "2", withExtension: "json")
//            let fileLocation3 = Bundle.main.url(forResource: "3", withExtension: "json"),
//            let fileLocation4 = Bundle.main.url(forResource: "4", withExtension: "json")
        {
            
            do {
                
                let data = try Data(contentsOf: fileLocation1)
//                let data2 = try Data(contentsOf: fileLocation2)
//                let data3 = try Data(contentsOf: fileLocation3)
//                let data4 = try Data(contentsOf: fileLocation4)



                
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([DictionaryData].self, from: data)
//                let dataFromJson2 = try jsonDecoder.decode([DictionaryData].self, from: data2)
//                let dataFromJson3 = try jsonDecoder.decode([DictionaryData].self, from: data3)
//                let dataFromJson4 = try jsonDecoder.decode([DictionaryData].self, from: data4)
//
                
                self.dictionaryData = dataFromJson
//                self.dictionaryData.append(contentsOf: dataFromJson2)
//                self.dictionaryData.append(contentsOf: dataFromJson3)
//                self.dictionaryData.append(contentsOf: dataFromJson4)

                
            } catch {
                print (error)
            }
            
        }
    }
    
    
    
    func sort () {
        self.dictionaryData = self.dictionaryData.sorted(by: {$0.character<$1.character})
    }
    
    func convert () {

for i in 0...dictionaryData.count-1 {
    let character = dictionaryData[i].character
    let pinyin = dictionaryData[i].pinyin
    let descriprion = dictionaryData[i].descriptions
    let isFavourite = false
    let value = DictionaryDataFinal(character: character, pinyin: pinyin, descriptions: descriprion, isFavourite: isFavourite)
       dictionaryDataFinal.append(value)
   }


    }
}
