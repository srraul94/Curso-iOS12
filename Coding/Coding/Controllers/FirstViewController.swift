//
//  FirstViewController.swift
//  Coding
//
//  Created by Raúl  on 02/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

//Primero la clase de la que heradmos, despues delegados y demás.
class FirstViewController: UIViewController, UITextFieldDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        //Cerramos el teclado.
        textField.resignFirstResponder()
       
        if let thetext = textField.text{
            print(thetext)
        }
        
        return true
    }

    


}

