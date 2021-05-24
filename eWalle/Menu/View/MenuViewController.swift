//
//  MenuViewController.swift
//  eWalle
//
//  Created by Александр on 22.05.2021.
//

import UIKit

protocol MenuViewProtocol: class {
  var userName: String! { get }
  var userLocation: String! { get }
  var userImage: String! { get }
  var delegate: HomeViewControllerDelegate? { get }
  var navigationController: UINavigationController? { get }
  
  
  func getUser(userName: String, userLocation: String, userImage: String)
  func configureMenuView(buttonTitles: [String])
}

class MenuViewController: UIViewController {
  
  var userName: String!
  var userLocation: String!
  var userImage: String!
  
  
  var menuView: MenuView!
  var userView: UserView!
  var delegate: HomeViewControllerDelegate?
  var presenter: MenuViewPresenterProtocol!
  
  private let configurator: MenuConfiguratorProtocol = MenuConfigurator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor(named: "MenuColor") ?? .black
    configurator.configure(with: self)
    presenter.viewDidLoad()
    configureView()
  }
  
  @objc func logoutAction(sender: UIButton) {
    presenter.logoutAction()
  }
  
  @objc func cancelAction(sender: UIButton) {
    presenter.cancellAction()
  }
  
}


// MARK: - MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
  func switchMenuButton(to nameMenuButton: String) {
    presenter.menuButton(nameMenuButton: nameMenuButton)
  }
}

// MARK: - MenuViewProtocol
extension MenuViewController: MenuViewProtocol {
  
  func configureMenuView(buttonTitles: [String]) {
    var menuViewOriginY = 219
    if view.frame.size.width < 381 {
      menuViewOriginY = 110
    }
    menuView = MenuView(frame: CGRect(x: 30, y: menuViewOriginY, width: 91, height: 378), buttonTitles: buttonTitles)
    view.addSubview(menuView)
    menuView.delegate = self
  }
  
  func getUser(userName: String, userLocation: String, userImage: String) {
    self.userName = userName
    self.userLocation = userLocation
    self.userImage = userImage
  }
}
