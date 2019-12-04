//
//  Pregunta.swift
//  QuizApp
//
//  Created by Raúl  on 04/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import Foundation


class Pregunta: CustomStringConvertible,Codable {
    
    let questionText:String
    let answer:Bool
    
    enum CodingKeys: String,CodingKey{
        case questionText = "question"
        case answer = "answer"
    }
    
    var description:String {
        let respuesta = (answer ? "Verdadera" : "Falsa")
        return """
        Pregunta:
            - \(questionText)
            - Respuesta: \(respuesta)
        """
    }
    
    
    init(text:String,correctAnswer:Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}



struct QuestionsBank:Codable {
    var questions : [Pregunta]
}


