//
//  ViewController.swift
//  El Adivino
//
//  Created by Raúl  on 29/11/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelRespuesta: UILabel!
    
    let answersArray:[String] = ["Si", "No", "Puede Ser", "Pregunta otra vez", "No tengo ni idea", "Ni lo sueñes"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPreguntarPressed(_ sender: Any) {
        preguntar()
    }
    
    func preguntar (){
        let numeroAletorio = Int.random(in: 0 ..< self.answersArray.count)
        let answerSelected = answersArray[numeroAletorio]
        labelRespuesta.text = answerSelected
    }
    
    override func becomeFirstResponder() -> Bool {
           return true
       }
       
       override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
           if(motion == .motionShake){
            preguntar()
           }
       }
    
}

