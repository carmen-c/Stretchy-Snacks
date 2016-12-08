//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by carmen cheng on 2016-12-08.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Buttons
    @IBAction func plusButton(_ sender: UIButton) {
        print ("plus icon pressed")
        self.navHeightConstraint.constant = 200
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: <#T##UIViewAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
            
            self.view.layoutIfNeeded()
        })
    }
    
    
    
    // MARK: Properties
    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    
    
    
    // MARK: Views
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

