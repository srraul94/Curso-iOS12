//
//  ViewController.swift
//  CharlApp
//
//  Created by Raúl  on 10/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Auth.auth().currentUser != nil {
            //ya logueado.
            self.performSegue(withIdentifier: "goToChat", sender: self)
        }
    }


}

