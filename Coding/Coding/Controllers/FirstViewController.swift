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

    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge = -1
    var userName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateValues(slider: self.sliderAge)
        //self.userAge  = Int(self.sliderAge.value)
        //self.labelAge.text = "\(self.userAge)"
        
    }
    
    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        
        //print(Int(sender.value))
        updateValues(slider: sender)
       // self.userAge = Int(sender.value)
       // self.labelAge.text = "\(userAge)"
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        
        let shouldEnterParty = (self.userName == "Raul") || (self.userAge >= 18)
        if(shouldEnterParty){
            print("Puedes entrar por ser tú")
            self.view.backgroundColor = UIColor(displayP3Red: 31.0/255.0, green: 207.0/255.0, blue: 40.0/255.0, alpha: 0.7)
        }
        else{
            print("No tienes acceso")
            self.view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)
        }
        
        /*
        if( self.userName == "Raul"){
            print("Puedes entrar por ser tú")
            self.view.backgroundColor = UIColor(displayP3Red: 31.0/255.0, green: 207.0/255.0, blue: 40.0/255.0, alpha: 0.7)
        }
        else{
            if( self.userAge >= 18){
                print("Puedes entrar por ser +18")
                self.view.backgroundColor = UIColor(displayP3Red: 50.0/255.0, green: 160.0/255.0, blue: 250.0/255.0, alpha: 1.0)

            }
            else{
                print("No tienes acceso")
                self.view.backgroundColor = UIColor(displayP3Red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)

            }
        }*/
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        //Cerramos el teclado.
        textField.resignFirstResponder()
       
        if let thetext = textField.text{
            print(thetext)
            self.userName = thetext
        }
        
        return true
    }
    
    func updateValues(slider: UISlider){
        
        self.userAge = Int(slider.value)
        self.labelAge.text = "\(userAge)"
    }

    


}

