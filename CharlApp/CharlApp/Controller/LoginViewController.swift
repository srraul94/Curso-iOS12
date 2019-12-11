//
//  LoginViewController.swift
//  CharlApp
//
//  Created by Raúl  on 10/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController{
    
   
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text else {
            print("No ha podido obtenerse el email")
            return
        }
        
        guard let pass = passwordTextField.text else {
            print("No ha podido obtenerse la password")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if error != nil {
                print(error!)
            }
            else{
                print("Login satisfactorio")
                self.performSegue(withIdentifier: "fromLoginToChat", sender: self)
            }
            
        }
    }




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
