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
        
        layer.cornerRadius = 10
        backgroundColor = .white
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        clipsToBounds = false
        layer.shadowOffset = CGSize(width: 1.0, height: 1)
    }
    
}
