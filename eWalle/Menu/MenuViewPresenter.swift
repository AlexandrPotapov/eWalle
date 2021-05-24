//
//  MenuViewPresenter.swift
//  eWalle
//
//  Created by Александр on 23.05.2021.
//

import Foundation

protocol MenuViewPresenterProtocol {
  var userName: String! { get }
  var locationUser: String! { get }
  
  func getMenuButtons()
  func cancellAction()
  func logoutAction()
  func menuButton(nameMenuButton: String)
  func getUser()
  func viewDidLoad()
}


class MenuViewPresenter {
  var userName: String!
  var locationUser: String!
  
  weak var  view: MenuViewProtocol!
  
  init(view: MenuViewProtocol) {
    self.view = view
  }
  
}


extension MenuViewPresenter: MenuViewPresenterProtocol {
  func viewDidLoad() {
    getUser()
    getMenuButtons()
  }
  
  func getMenuButtons() {
    var buttons = [String]()
    for menu in MenuModel.allCases {
      buttons.append(menu.description)
    }
    view.configureMenuView(buttonTitles: buttons)
  }
  
  func getUser() {
    view.getUser(userName: "Carol Black", userLocation: "Seattle,Washington", userImage: "UserImage")
    
  }
  
  
  func menuButton(nameMenuButton: String) {
    if nameMenuButton == "Home" {
      view.delegate?.toggleMenu()
    }
  }
  
  
  func logoutAction() {
    view.navigationController?.popViewController(animated: true)
    
  }
  
  func cancellAction() {
    view.delegate?.toggleMenu()
  }
}
