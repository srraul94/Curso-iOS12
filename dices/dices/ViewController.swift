//
//  ViewController.swift
//  dices
//
//  Created by Raúl  on 28/11/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    var randomDice1:Int = 0
    var randomDice2:Int = 0
    
    let dicesImages:[String] = ["dice1","dice2","dice3","dice4","dice5","dice6","dice1"]
    
    let faces:UInt32
    
    required init?(coder: NSCoder) {
        faces = UInt32(dicesImages.count)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollDicesPressed(_ sender: Any) {
        generateRandomDices()
    }
    
    
    func generateRandomDices(){
       
        randomDice1 = Int(arc4random_uniform(self.faces))
        randomDice2 = Int(arc4random_uniform(self.faces))
        
        imageViewDiceLeft.image = UIImage(named: dicesImages[randomDice1])
        imageViewDiceRight.image = UIImage(named: dicesImages[randomDice2])
        
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            
            self.imageViewDiceLeft.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            
            self.imageViewDiceRight.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))

            
        }) { (completed) in
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRight.transform = CGAffineTransform.identity

            
            self.imageViewDiceLeft.image = UIImage(named: self.dicesImages[self.randomDice1])
            self.imageViewDiceRight.image = UIImage(named: self.dicesImages[self.randomDice2])
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(motion == .motionShake){
            generateRandomDices()
        }
    }
    
}

