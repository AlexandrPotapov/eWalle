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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  @IBAction func signInButtonPressed(_ sender: UIButton) {
    print("signInButtonPressed")
  }
  
  @IBAction func createButtonPressed(_ sender: UIButton) {
    print("createButtonPressed")

  }
}
