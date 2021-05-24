//
//  PeoplesCell.swift
//  eWalle
//
//  Created by Александр on 20.05.2021.
//

import UIKit

protocol PeopleCellViewModel {
  var name: String { get }
  var profileImage: String { get }
}


class PeopleCell: UICollectionViewCell {
  @IBOutlet weak var peopleImage: UIImageView!
  @IBOutlet weak var peopleLabel: UILabel!
  
  static let reuseId = "PeopleCell"
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    peopleImage.layer.cornerRadius = peopleImage.bounds.height / 2
    peopleImage.clipsToBounds = true
  }
  
  func set(peopleCellViewModel: PeopleCellViewModel) {
    peopleImage.image = UIImage(named: peopleCellViewModel.profileImage)
    peopleLabel.text = peopleCellViewModel.name
  }
  
}
