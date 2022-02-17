//
//  BiographyViewController.swift
//  SBRepeat.HW2.3
//
//  Created by Philip Noskov on 17.02.2022.
//

import UIKit

class BiographyViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var biographyLabel: UILabel!
    
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = user.person.name + " " + user.person.surname
        
        image.layer.cornerRadius = image.frame.height / 2
        image.image = user.person.image

        biographyLabel.text = user.person.biography
        

    }
}
