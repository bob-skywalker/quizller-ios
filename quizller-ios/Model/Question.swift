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
    let imgId: String
    
    init(q: String, a: String, img: String) {
        self.text = q
        self.answer = a
        self.imgId = img
    }
}
