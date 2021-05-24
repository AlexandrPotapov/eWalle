//
//  MenuView.swift
//  eWalle
//
//  Created by Александр on 22.05.2021.
//

import UIKit

protocol MenuViewDelegate: class {
  func switchMenuButton(to nameMenuButton: String)
}

class MenuView: UIView {
  
  private var buttonTitles:[String]!
  private var buttons: [UIButton]!
  private var selectorView: UIView!
  
  
  var textColor: UIColor = UIColor(named: "Color#1B1D28") ?? .gray
  var selectorViewColor: UIColor = #colorLiteral(red: 1, green: 0.6745098039, blue: 0.1882352941, alpha: 1)
  
  
  weak var delegate: MenuViewDelegate?
  public private(set) var selectedIndex : Int = 0
  
  convenience init(frame:CGRect, buttonTitles:[String]) {
    self.init(frame: frame)
    self.buttonTitles = buttonTitles
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    self.backgroundColor = UIColor.white
    updateView()
  }
  
  @objc func buttonAction(sender:UIButton) {
    for (buttonIndex, btn) in buttons.enumerated() {
      btn.setTitleColor(textColor, for: .normal)
      btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Regular", size: 16)
      if btn == sender {
        let selectorPosition = frame.height/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
        selectedIndex = buttonIndex
        delegate?.switchMenuButton(to: btn.titleLabel?.text ?? "")
        UIView.animate(withDuration: 0.3) {
          self.selectorView.frame.origin.y = selectorPosition + 8.5
          self.selectorView.frame.origin.x = -30
        }
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 16)
      }
    }
  }
}

// MARK: Configuration View
extension MenuView {
  private func updateView() {
    createButton()
    configSelectorView()
    configStackView()
    
  }
  
  private func configStackView() {
    let stack = UIStackView(arrangedSubviews: buttons)
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fillProportionally
    stack.spacing = 2
    addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
  }
  
  private func createButton() {
    buttons = [UIButton]()
    buttons.removeAll()
    subviews.forEach({$0.removeFromSuperview()})
    for buttonTitle in buttonTitles {
      let button = UIButton(type: .system)
      button.setTitle(buttonTitle, for: .normal)
      button.addTarget(self, action:#selector(MenuView.buttonAction(sender:)), for: .touchUpInside)
      button.setTitleColor(textColor, for: .normal)
      button.titleLabel?.font =  UIFont(name: "Apple SD Gothic Neo Regular", size: 16)
      button.contentHorizontalAlignment = .left
      buttons.append(button)
    }
    buttons[selectedIndex].setTitleColor(textColor, for: .normal)
    buttons[selectedIndex].titleLabel?.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 16)
  }
  
  private func configSelectorView() {
    let selectorWidth = 33
    selectorView = UIView(frame: CGRect(x: -30, y: 11, width: 4, height: selectorWidth))
    selectorView.backgroundColor = selectorViewColor
    addSubview(selectorView)
  }
}
