//
//  LoginViewController.swift
//  eWalle
//
//  Created by Александр on 20.05.2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//  // MARK: Routing
//
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//  {
//    if segue.identifier == "HomeSegue" {
//        let homeVC = segue.destination as! HomeViewController
//        let configurator: HomeConfiguratorProtocol = HomeConfigurator()
//        configurator.configure(with: homeVC)
//    }
//  }
  @IBAction func signInButtonPressed(_ sender: UIButton) {
    print("signInButtonPressed")
  }
  
  @IBAction func createButtonPressed(_ sender: UIButton) {
    print("createButtonPressed")

  }
}
