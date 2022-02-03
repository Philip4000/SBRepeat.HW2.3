//
//  WelcomeViewController.swift
//  SBRepeat.HW2.3
//
//  Created by Philip Noskov on 03.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userLabel: UILabel!
    
    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userLabel.text = userName

    }
    

}
