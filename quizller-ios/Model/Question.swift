//
//  Question.swift
//  quizller-ios
//
//  Created by bo zhong on 12/13/22.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
