//
//  HomeConfigurator.swift
//  eWalle
//
//  Created by Александр on 21.05.2021.
//

import Foundation

protocol HomeConfiguratorProtocol: class {
  func configure(with viewController: HomeViewController)
  
}

class HomeConfigurator: HomeConfiguratorProtocol {
  func configure(with viewController: HomeViewController) {
    let presenter = HomePresenter(view: viewController)
    viewController.presenter = presenter
    
  }
}
