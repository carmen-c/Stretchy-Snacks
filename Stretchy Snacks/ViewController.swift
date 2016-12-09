//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by carmen cheng on 2016-12-08.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
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
                
                for aConstraint in self.snackView.constraints{
                    if aConstraint.identifier == "centerYSnackTitle"{
                        aConstraint.isActive = false
                    }
                    if aConstraint.identifier == "alt"{
                        aConstraint.isActive = true
                    }
                }
                
            }
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        
        if let testString = sender.view!.accessibilityIdentifier! as String! {
            
            switch testString{
                
            case "snackimage1":
                self.tableArray.append("oreos")
            case "snackimage2":
                self.tableArray.append("pizza pockets")
            case "snackimage3":
                self.tableArray.append("pop tarts")
            case "snackimage4":
                self.tableArray.append("popsicle")
            case "snackimage5":
                self.tableArray.append("ramen")
            default:
                break
                
            }
            self.snackTableView.reloadData()
        }
    }
    
    // MARK: Properties
    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var snackView: UIView!
    @IBOutlet weak var snackTableView: UITableView!
    
    let stackView = UIStackView()
    var tableArray = [String]()
    var counter = 0
    let snacksArray = ["oreos", "pizza_pockets", "pop_tarts", "popsicle", "ramen"]
    
    
    // MARK: Views
    override func viewDidLoad() {
        super.viewDidLoad()
        addStackView()
        addSnackViews()
        self.stackView.isHidden = true
        navBarTitle()
        
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
        
            for snack in snacksArray {
            self.counter += 1
            let snackDisplay = UIImageView()
            snackDisplay.accessibilityIdentifier = "snackimage\(self.counter)"
            snackDisplay.image = UIImage(named: snack)
            snackDisplay.translatesAutoresizingMaskIntoConstraints = false
//            snackDisplay.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
//            snackDisplay.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
            
            snackDisplay.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            snackDisplay.addGestureRecognizer(tap)
            self.stackView.addArrangedSubview(snackDisplay)
        }
        
    }
    
    // MARK: Table View
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.snackTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let moo = self.tableArray[indexPath.row] 
        cell.textLabel?.text = moo
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
    // MARK: Snack Title
    func navBarTitle() {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "SNACKS"
        self.snackView.addSubview(label)
        
        let labelx = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: snackView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0)
        
        let labely = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: snackView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0)
        
        let labelyalt = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: snackView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: -40)
        
        labely.identifier = "centerYSnackTitle"
        labelyalt.identifier = "alt"
        labelyalt.isActive = false
        
        self.snackView.addConstraint(labelx)
        self.snackView.addConstraint(labely)
        self.snackView.addConstraint(labelyalt)
        
    }
    
    
    
}

