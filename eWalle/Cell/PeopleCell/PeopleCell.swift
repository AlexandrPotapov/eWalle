//
//  PeoplesCell.swift
//  eWalle
//
//  Created by Александр on 20.05.2021.
//

import UIKit

class PeopleCell: UICollectionViewCell {
  @IBOutlet weak var peopleImage: UIImageView!
  @IBOutlet weak var peopleLabel: UILabel!
  
  static let reuseId = "PeopleCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func set(people: People) {
    peopleImage.image = UIImage(named: people.icon)
    peopleLabel.text = people.name
  }

}
