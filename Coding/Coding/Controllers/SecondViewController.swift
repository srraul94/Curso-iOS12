//
//  SecondViewController.swift
//  Coding
//
//  Created by Raúl  on 02/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var fibonacci:[Int] = [0,1]
    var fiboID = 1
    var calculateGoldNum = false
    
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var textViewResult: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelGoldNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateValues(id: Int(self.stepper.value))
        generateFibonacciNumbers()
    }
    
    @IBAction func stepperPresed(_ sender: UIStepper) {
       // self.fiboID = Int(sender.value)
       // self.labelNumber.text = "\(self.fiboID)"
        updateValues(id: Int(sender.value))
        calculateGoldNumber()
    }
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        self.calculateGoldNum = sender.isOn
        calculateGoldNumber()
    }
    
    func calculateGoldNumber (){
        if(self.calculateGoldNum){
            //generar numero de oro entre 2 ultimos numeros de la sucesion.
            let last = Double(self.fibonacci[self.fibonacci.count-1])
            let previous = Double(self.fibonacci[self.fibonacci.count-2])
            let goldNum = last / previous
            self.labelGoldNumber.text = "\(goldNum)"
        }
        else{
            //Texto por defecto en la etiqueta.
            self.labelGoldNumber.text = "Ver número de oro"
        }
        
    }
    
    
    func generateFibonacciNumbers(){
       /* if(self.fiboID <= 1 || fiboID > 100){
            return
        }*/
        self.fibonacci = [0,1]
        for i in 2...fiboID {
            fibonacci.append(self.fibonacci[i-1] + self.fibonacci[i-2])
        }
        let fibonacciStr = self.fibonacci.compactMap({String ($0)})
        let result:String = fibonacciStr.joined(separator: "\n")
        self.textViewResult.text = result
        print(self.fibonacci)
    }
    
    func updateValues(id:Int){
        self.fiboID = id
        self.labelNumber.text = "\(self.fiboID)"
        generateFibonacciNumbers()
    }


}

