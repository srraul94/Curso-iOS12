//
//  ViewController.swift
//  iAmRich
//
//  Created by Raúl  on 22/11/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewDiamond: UIImageView!
    @IBOutlet weak var buttonHitme: UIButton!
    
    
    //Metodos
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("he pulsado el boton")
        self.labelTitle.text = "Soy rico!"
        self.labelTitle.textColor = UIColor.blue
        //self.imageViewDiamond.image = UIImage(named: "")
        self.buttonHitme.titleLabel?.text = "Pulsame"
        
        let controller = UIAlertController(title: "I am rich", message: "I Am Rich, i am deserve, i am good", preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("He aceptado!")
        }
        let action2 = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler:  { (action) in
            print("He eliminado")
        })
        
        let action3 = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel){ _ in //o poner (_)
            print("He cancelado")
        }
        controller.addAction(action)
        controller.addAction(action2)
        controller.addAction(action3)
        self.show(controller, sender: nil)
    }
    
}

