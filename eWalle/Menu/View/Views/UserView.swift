//
//  UserView.swift
//  eWalle
//
//  Created by Александр on 23.05.2021.
//

import UIKit

protocol UserViewDelegate: class {
  func switchMenuButton(to name: String)
}

class UserView: UIView {
  
  let textColor: UIColor = UIColor(named: "Color#1B1D28") ?? .gray
  
  private var userName: String!
  private var userLocation: String!
  private var userImage: String!
  
  private var userNameLabel: UILabel!
  private var userLocationLabel: UILabel!
  private var userIconView: UIView!
  private var userImageView: UIImageView!
  
  
  
  
  convenience init(frame:CGRect, userName: String, userLocation: String, userImage: String) {
    self.init(frame: frame)
    self.userName = userName
    self.userLocation = userLocation
    self.userImage = userImage
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    updateView()
  }
}



extension UserView {
  private func updateView() {
    let image = UIImage(named: "Rectangle")
    let imageView = UIImageView(image: image!)
    addSubview(imageView)
    configLabels()
    configUserIconView()
  }
  
  private func configLabels() {
    userNameLabel = UILabel()
    userNameLabel.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 16)
    userNameLabel.text = userName
    userNameLabel.textColor = textColor
    addSubview(userNameLabel)
    
    userLocationLabel = UILabel()
    userLocationLabel.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 10)
    userLocationLabel.text = userLocation
    userLocationLabel.textColor = textColor
    addSubview(userLocationLabel)
    
    userNameLabel.translatesAutoresizingMaskIntoConstraints = false
    userNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 35).isActive = true
    userNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 84).isActive = true
    
    userLocationLabel.translatesAutoresizingMaskIntoConstraints = false
    userLocationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 57).isActive = true
    userLocationLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 84).isActive = true
  }
  
  private func configUserIconView() {
    
    let userImageView = UIImageView(image: UIImage(named: userImage) ?? UIImage())
    let view = UIView()
    userImageView.layer.cornerRadius = 20
    userImageView.clipsToBounds = true
    view.layer.cornerRadius = 20
    view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
    
    view.addSubview(userImageView)
    addSubview(view)
    
    view.translatesAutoresizingMaskIntoConstraints = false
    view.topAnchor.constraint(equalTo: self.topAnchor, constant: 32).isActive = true
    view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
    view.widthAnchor.constraint(equalToConstant: 40).isActive = true
    view.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    userImageView.translatesAutoresizingMaskIntoConstraints = false
    userImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
  }
}
