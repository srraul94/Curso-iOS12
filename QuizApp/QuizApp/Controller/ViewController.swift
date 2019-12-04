//
//  ViewController.swift
//  QuizApp
//
//  Created by Raúl  on 03/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelProgress: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    let factory = PreguntasFactory()
    
    var currentScore = 0
    var currentQuestionID = 0
    var numCorrectAnswers = 0
    var questionCurrent:Pregunta!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.factory.questionsBank.questions.shuffle()
        starGame()
       
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
    @IBAction func buttonAnswerPressed(_ sender: UIButton) {
        var isCorrect:Bool
        if(sender.tag == 1 ){
            //boton true
            isCorrect = (self.questionCurrent.answer == true)
        }
        else{
            //boton false
            isCorrect = (self.questionCurrent.answer == false)
        }
        
       // var tituloMensaje = "Has fallado!"
        
        if(isCorrect){
            self.numCorrectAnswers += 1
            self.currentScore += 100
           // tituloMensaje = "Correcto!"
            ProgressHUD.showSuccess("Correcto!")
           
        }
        else{
            ProgressHUD.showError("Has fallado!")
        }
        
        self.nextQuestion()
        self.updateUIElements()
               
       /* let alert = UIAlertController(title: tituloMensaje, message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.nextQuestion()
            self.updateUIElements()
        }
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)*/
        
       
       
    }
    
    func starGame(){
        self.currentScore = 0
        self.currentQuestionID = 0
        self.numCorrectAnswers = 0
       
        nextQuestion()
        updateUIElements()
    }
    
    func nextQuestion(){
        if let newQuestion = self.factory.getQuestionAt(index: self.currentQuestionID){
            self.questionCurrent = newQuestion
            labelQuestion.text = self.questionCurrent.questionText
            self.currentQuestionID += 1
        }
        else{
            gameOver()
        }
    }
    
    func gameOver(){
        let alert = UIAlertController(title: "Fin de la partida", message: "Has acertado: \(numCorrectAnswers) de \(self.currentQuestionID). Prueba de nuevo!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.starGame()
        }
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    
    func updateUIElements(){
        self.labelScore.text = "Puntuación: \(self.currentScore)"
        self.labelProgress.text = "\(currentQuestionID) / \(self.factory.questionsBank.questions.count)"
        
        for constraint in self.progressBar.constraints {
            if constraint.identifier == "barWidth"{
                constraint.constant = (CGFloat(self.view.frame.width) / CGFloat(self.factory.questionsBank.questions.count)) * CGFloat(self.currentQuestionID)
            }
        }
        
        
    }
    
    
    
}

