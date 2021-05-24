//
//  MenuViewControllerExtension.swift
//  eWalle
//
//  Created by Александр on 23.05.2021.
//

import Foundation
import UIKit

// MARK: - Configure View
extension MenuViewController {
  
  public func configureView() {
    configureUserView()
    configureLogoutImageView()
    configureLogoutButton()
    configureVersionLabel()
    configureCancelButton()
  }
  
  private func configureUserView() {
    userView = UserView(frame: CGRect(x: 0, y: 0, width: 210, height: 107), userName: userName, userLocation: userLocation, userImage: userImage)
    view.addSubview(userView)
  }
  private func configureLogoutImageView() {
    
    let logoutImage = UIImage(named: "Logout")
    let logoutImageView = UIImageView(image: logoutImage ?? UIImage())
    
    view.addSubview(logoutImageView)
    
    var bottomAnchorConstant: CGFloat = -107
    if view.frame.size.width < 381 {
      bottomAnchorConstant = -50
    }
    
    logoutImageView.translatesAutoresizingMaskIntoConstraints = false
    logoutImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
    logoutImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomAnchorConstant).isActive = true
    logoutImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
    logoutImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
  }
  
  private func configureLogoutButton() {
    let textColor: UIColor = UIColor(named: "Color#1B1D28") ?? .gray
    
    let logoutButton = UIButton(type: .system)
    logoutButton.setTitle("Logout", for: .normal)
    logoutButton.setTitleColor(textColor, for: .normal)
    logoutButton.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 16)
    logoutButton.addTarget(self, action:#selector(self.logoutAction(sender:)), for: .touchUpInside)
    view.addSubview(logoutButton)
    
    var bottomAnchorConstant: CGFloat = -104
    if view.frame.size.width < 381 {
      bottomAnchorConstant = -47
    }
    
    logoutButton.translatesAutoresizingMaskIntoConstraints = false
    logoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 54).isActive = true
    logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomAnchorConstant).isActive = true
    logoutButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
    logoutButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
  }
  
  private func configureVersionLabel() {
    let versionLabel = UILabel()
    versionLabel.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 10)
    versionLabel.text = "Version 2.0.1"
    versionLabel.textColor = #colorLiteral(red: 0.2274509804, green: 0.2588235294, blue: 0.462745098, alpha: 1)
    view.addSubview(versionLabel)
    
    versionLabel.translatesAutoresizingMaskIntoConstraints = false
    versionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
    versionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27).isActive = true
    versionLabel.widthAnchor.constraint(equalToConstant: 68).isActive = true
    versionLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    
  }
  
  private func configureCancelButton() {
    let cancelButton = UIButton()
    cancelButton.setImage(UIImage(named: "Cross"), for: .normal)
    cancelButton.addTarget(self, action:#selector(self.cancelAction(sender:)), for: .touchUpInside)
    view.addSubview(cancelButton)
    
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -28).isActive = true
    cancelButton.widthAnchor.constraint(equalToConstant: 13).isActive = true
    cancelButton.heightAnchor.constraint(equalToConstant: 13).isActive = true
  }
}
