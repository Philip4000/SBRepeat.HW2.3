//
//  BiographyViewController.swift
//  SBRepeat.HW2.3
//
//  Created by Philip Noskov on 17.02.2022.
//

import UIKit

class BiographyViewController: UIViewController {
    
    @IBOutlet var image: UIImageView! {
        didSet {
            image.layer.cornerRadius = image.frame.height / 2
        }
    }
    @IBOutlet var biographyLabel: UILabel!
    
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.person.fullName
        
        image.image = UIImage(named: user.person.image)

        biographyLabel.text = user.person.biography
        

    }
}
