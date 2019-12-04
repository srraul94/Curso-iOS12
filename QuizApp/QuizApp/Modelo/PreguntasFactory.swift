//
//  PreguntasFactory.swift
//  QuizApp
//
//  Created by Raúl  on 04/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import Foundation

class PreguntasFactory {
    
    //  var questions:[Pregunta] = []
    
    //utilizamos struct creado para asignarle el tipo directamente.
    var questionsBank : QuestionsBank!
    
    init() {
        //Procesado manual de plist
        /*
        if let path = Bundle.main.path(forResource: "QuestionsBank", ofType: "plist"){
            if let plist = NSDictionary(contentsOfFile: path){
                let questionsData = plist["questions"] as! [AnyObject]
                
                for q in questionsData{
                    if let text = q["question"], let ans = q["answer"]{
                        questions.append(Pregunta(text: text as! String, correctAnswer: ans as! Bool))
                    }
                }
            }
        }
        else{
            print("No localizado")
        }*/
        
        //Procesadoa automatico con Codable.
        
        do {
            if let url = Bundle.main.url(forResource: "QuestionsBank", withExtension: "plist"){
                 let data = try Data(contentsOf: url)
                 self.questionsBank = try PropertyListDecoder().decode(QuestionsBank.self, from: data)
                
            }
        } catch  {
            print(error)
        }
    }
    
    func getQuestionAt(index:Int) ->Pregunta? {
        
        if(index < 0 || index >= self.questionsBank.questions.count ){
            return nil
        }
        else{
            return self.questionsBank.questions[index]
        }
    }
    
    func getRandomQuestion() -> Pregunta{
        return self.questionsBank.questions[Int.random(in: 0 ..< self.questionsBank.questions.count)]
    }
}
