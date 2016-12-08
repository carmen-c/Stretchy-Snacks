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
        
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {
            
            if self.navHeightConstraint.constant == 200{
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.navHeightConstraint.constant = 64
                self.stackView.isHidden = true
                
            }else if self.navHeightConstraint.constant == 64 {
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
                self.navHeightConstraint.constant = 200
                self.stackView.isHidden = false
            }
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    
    
    // MARK: Properties
    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var snackView: UIView!
    let stackView = UIStackView()
    
    // MARK: Views
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addStackView()
        addSnackViews()
        self.stackView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addStackView() {
        stackView.alignment = .leading
        stackView.spacing = 5.0
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        self.snackView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        let stackConstraintTop = NSLayoutConstraint(item: stackView, attribute: NSLayoutAttribute.topMargin, relatedBy: NSLayoutRelation.equal, toItem: snackView, attribute: NSLayoutAttribute.topMargin, multiplier: 1.0, constant: 50)
        
        let stackConstraintBottom = NSLayoutConstraint(item: stackView, attribute: NSLayoutAttribute.bottomMargin, relatedBy: NSLayoutRelation.equal, toItem: snackView, attribute: NSLayoutAttribute.bottomMargin, multiplier: 1.0, constant: 10)
        
        let stackConstraintLeft = NSLayoutConstraint(item: stackView, attribute: NSLayoutAttribute.leftMargin, relatedBy: NSLayoutRelation.equal, toItem: snackView, attribute: NSLayoutAttribute.leftMargin, multiplier: 1.0, constant: 10)
        
        let stackConstraintRight = NSLayoutConstraint(item: stackView, attribute: NSLayoutAttribute.rightMargin, relatedBy: NSLayoutRelation.equal, toItem: snackView, attribute: NSLayoutAttribute.rightMargin, multiplier: 1.0, constant: -50)
        
        self.snackView.addConstraint(stackConstraintTop)
        self.snackView.addConstraint(stackConstraintBottom)
        self.snackView.addConstraint(stackConstraintLeft)
        self.snackView.addConstraint(stackConstraintRight)
        
    
    }
    
    func addSnackViews() {
        let snack1 = UIImageView()
        snack1.image = UIImage(named: "oreos")
        snack1.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        snack1.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        let snack2 = UIImageView()
        snack2.image = UIImage(named: "pizza_pockets")
        snack2.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        snack2.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        let snack3 = UIImageView()
        snack3.image = UIImage(named: "pop_tarts")
        snack3.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        snack3.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        let snack4 = UIImageView()
        snack4.image = UIImage(named: "popsicle")
        snack4.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        snack4.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        let snack5 = UIImageView()
        snack5.image = UIImage(named: "ramen")
        snack5.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        snack5.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        self.stackView.addArrangedSubview(snack1)
        self.stackView.addArrangedSubview(snack2)
        self.stackView.addArrangedSubview(snack3)
        self.stackView.addArrangedSubview(snack4)
        self.stackView.addArrangedSubview(snack5)
    }
}

