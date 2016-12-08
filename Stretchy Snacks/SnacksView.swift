//
//  SnacksView.swift
//  Stretchy Snacks
//
//  Created by carmen cheng on 2016-12-08.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

import UIKit
import Foundation

class SnacksView: UIView {

    func viewDidLoad() {
    
    let stackView = UIStackView()
    stackView.alignment = .center
    stackView.spacing = 16.0
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    
    let snack1 = UIImageView()
    snack1.image = UIImage(named: "oreos")
    snack1.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
    snack1.widthAnchor.constraint(equalToConstant: 120.0).isActive = true

    let snack2 = UIImageView()
    snack2.image = UIImage(named: "pizza_pockets")
    snack2.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
    snack2.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        
    let snack3 = UIImageView()
    snack3.image = UIImage(named: "pop_tarts")
    snack3.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
    snack3.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        
    let snack4 = UIImageView()
    snack4.image = UIImage(named: "popsicle")
    snack4.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
    snack4.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        
    let snack5 = UIImageView()
    snack5.image = UIImage(named: "ramen")
    snack5.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
    snack5.widthAnchor.constraint(equalToConstant: 120.0).isActive = true

    self.addSubview(stackView)
    stackView.addSubview(snack1)
    stackView.addSubview(snack2)
    stackView.addSubview(snack3)
    stackView.addSubview(snack4)
    stackView.addSubview(snack5)
    }
    
}
