//
//  DictionaryData.swift
//  Chinee Dictionary
//
//  Created by Krime Loma on 7/11/20.
//  Copyright © 2020 Rakk Kiryl. All rights reserved.
//

import Foundation

struct DictionaryData: Codable {
    var character : String
    var pinyin : String
    var descriptions : String
}

struct DictionaryDataFinal {
    var character : String
    var pinyin : String
    var descriptions : String
    var isFavourite : Bool
}

