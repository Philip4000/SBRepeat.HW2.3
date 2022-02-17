//
//  ProfileViewController.swift
//  SBRepeat.HW2.3
//
//  Created by Philip Noskov on 17.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = image.frame.height / 2
        
        image.image = user.person.image
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        ageLabel.text = String(user.person.age)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let biographyVC = segue.destination as? BiographyViewController else {return}
        biographyVC.user = user
    }
}
