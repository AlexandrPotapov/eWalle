//
//  MenuConfigurator.swift
//  eWalle
//
//  Created by Александр on 23.05.2021.
//

import Foundation

protocol MenuConfiguratorProtocol: class {
  func configure(with viewController: MenuViewController)
  
}

class MenuConfigurator: MenuConfiguratorProtocol {
  func configure(with viewController: MenuViewController) {
    let presenter = MenuViewPresenter(view: viewController)
    viewController.presenter = presenter
    
  }
}
