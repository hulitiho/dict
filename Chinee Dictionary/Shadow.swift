//
//  Shadow.swift
//  Chinee Dictionary
//
//  Created by Krime Loma on 7/1/20.
//  Copyright © 2020 Rakk Kiryl. All rights reserved.
//

import UIKit
class ShadowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        propertyOfView()
    }
    
    required init?(coder eDecoder: NSCoder) {
        super.init(coder: eDecoder)
        propertyOfView()
    }
    
    
    func propertyOfView () {
        
        layer.cornerRadius = 15
        backgroundColor = .white
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
        clipsToBounds = false
        layer.shadowOffset = CGSize(width: 2.0, height: 3)
    }
    
}
