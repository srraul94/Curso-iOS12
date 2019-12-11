//
//  RegisterViewController.swift
//  CharlApp
//
//  Created by Raúl  on 10/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var conditionsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonCreatePressed(_ sender: UIButton) {
        
        guard conditionsSwitch.isOn else{
            //TODO: crear alerta de aceptar condiciones.
            let alerta = UIAlertController.init(title: "Error!", message: "Debe aceptar las condicones", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alerta.addAction(action)
            present(alerta,animated: true,completion: nil)
            return
        }
        
        guard passwordTextField.text == repeatPasswordTextField.text else{
            let alerta = UIAlertController.init(title: "Error!", message: "Las contraseñas deben coincidir", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alerta.addAction(action)
            present(alerta,animated: true,completion: nil)
            return
        }
        
        guard let email = correoTextField.text else{
            let alerta = UIAlertController.init(title: "Error!", message: "Introduzca un email válido", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alerta.addAction(action)
            present(alerta,animated: true,completion: nil)
            return
        }
        
        guard let password = passwordTextField.text else{
            let alerta = UIAlertController.init(title: "Error!", message: "Introduzca una password válida", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alerta.addAction(action)
            present(alerta,animated: true,completion: nil)
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error!)
            }
            else{
                //El usuario se registra correctamente.
                print("usuario registrado correctamente")
                self.performSegue(withIdentifier: "fromRegisterToChat", sender: self)
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
