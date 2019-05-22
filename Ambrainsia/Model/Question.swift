//
//  Question.swift
//  Ambrainsia
//
//  Created by Timothy Itodo on 5/22/19.
//  Copyright © 2019 Timothy Itodo. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
