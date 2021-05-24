//
//  People.swift
//  eWalle
//
//  Created by Александр on 21.05.2021.
//

import Foundation

struct People: Codable, PeopleCellViewModel {
  let id: Int
  let name: String
  let email: String
  let profileImage: String
  let location: String
}
