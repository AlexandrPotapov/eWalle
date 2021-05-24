//
//  MenuModel.swift
//  Sushi App
//
//  Created by Алексей Пархоменко on 25/02/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

enum MenuModel: CustomStringConvertible, CaseIterable {
  case home
  case profile
  case accounts
  case transactions
  case stats
  case settings
  case help
  
  var description: String {
    switch self {
    case .home: return "Home"
    case .profile: return "Profile"
    case .accounts: return "Accounts"
    case .transactions: return "Transactions"
    case .stats: return "Stats"
    case .settings: return "Setting"
    case .help: return "Help"
    }
  }
}
