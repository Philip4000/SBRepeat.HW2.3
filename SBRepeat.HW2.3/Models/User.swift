//
//  User.swift
//  SBRepeat.HW2.3
//
//  Created by Philip Noskov on 17.02.2022.
//

import UIKit

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            username: "User",
            password: "12345",
            person: Person(
                name: "Tim",
                surname: "Cook",
                age: 61,
                image: UIImage(named: "TimCook")!,
                biography: "  Timothy Donald Cook (born November 1, 1960) is an American business executive who has been the chief executive officer of Apple Inc. since 2011. Cook previously served as the company's chief operating officer under its co-founder Steve Jobs. \n\n  Cook joined Apple in March 1998 as a senior vice president for worldwide operations, and then served as the executive vice president for worldwide sales and operations. He was made the chief executive on August 24, 2011, prior to Jobs' death in October of that year. During his tenure as the chief executive, he has advocated for the political reformation of international and domestic surveillance, cybersecurity, American manufacturing, and environmental preservation. Since 2011 when he took over Apple, to 2020, Cook doubled the company's revenue and profit, and the company's market value increased from $348 billion to $1.9 trillion.\n\n  In 2014, Cook became the first chief executive of a Fortune 500 company to publicly come out as gay. Cook also serves on the boards of directors of Nike, Inc. and the National Football Foundation; he is a trustee of Duke University, his alma mater. Outside of Apple, Cook engages in philanthropy, and in March 2015, he said he planned to donate his fortune to charity."
            )
            )
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let image: UIImage
    let biography: String
}
