//
//  ViewController.swift
//  IAmPoor
//
//  Created by Raúl  on 26/11/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var buttonEnriquecer: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func enriquecerme(_ sender: Any) {
        self.labelTitle.text = "Soy rico!"
        self.imageViewLogo.image = UIImage(named: "536072")
    }
    
}

