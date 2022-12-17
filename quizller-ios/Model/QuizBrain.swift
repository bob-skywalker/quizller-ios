//
//  QuizBrain.swift
//  quizller-ios
//
//  Created by bo zhong on 12/13/22.
//

import Foundation


struct QuizBrain{
    var questionNum = 0
    var correctQuestionNum = 0
    
    var quiz = [
        Question(q: "A slug's blood is green.", a: "True", img: "Q1"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True", img: "Q2"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True", img: "Q3"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True", img: "Q4"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False", img: "Q5"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True", img: "Q6"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False", img: "Q7"),
        Question(q: "Google was originally called 'Backrub'.", a: "True", img:"Q8"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True", img:"Q9"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False", img: "Q10"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False", img:"Q11"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True", img: "Q12"),
        Question(q: "The blue whale is the biggest animal to have ever lived.", a: "True", img: "Q13"),
        Question(q: "The hummingbird egg is the world's smallest bird egg.", a: "True", img: "Q14"),
        Question(q: "Pigs roll in the mud because they don’t like being clean.", a: "False", img: "Q15"),
        Question(q: "Bats are blind.", a: "False", img: "Q16"),
        Question(q: "An ant can lift 1,000 times its body weight.", a: "False", img: "Q17"),
        Question(q: "An octopus has seven hearts.", a: "False", img: "Q18"),
        Question(q: "The goat is the national animal of Scotland.", a: "False", img: "Q19"),
        Question(q: "A monkey was the first non-human to go into space.", a: "False", img: "Q20"),
        Question(q: "The Atlantic Ocean is the biggest ocean on Earth.", a: "False", img: "Q21"),
        Question(q: "The total length of the Great Wall of China adds up to 13,171 miles.", a: "True", img: "Q22"),
        Question(q: "Greenland is the largest island in the world.", a: "True", img: "Q23"),
        Question(q: "There are more countries in South America than Africa.", a: "False", img: "Q24"),
        Question(q: "Vatican City is the smallest country in the world.", a: "True", img: "Q25"),
        Question(q: "Venezuela is home to the world’s highest waterfall.", a: "True", img: "Q26"),
        Question(q: "The human eye can distinguish 10 million different colors.", a: "True", img: "Q27"),
        Question(q: "The human body is about 60% water.", a: "True", img: "Q28"),
        Question(q: "Toy Story was Pixar’s first movie.", a: "True", img: "Q29"),
        Question(q: "French fries originated from France.", a: "False", img: "Q30"),
        Question(q: "The Chinese New Year is celebrated on the same day every year.", a: "False", img: "Q31"),
        Question(q: "The U.S. and Canada celebrate Thanksgiving on the same day.", a: "False", img: "Q32"),
        Question(q: "Pinocchio was the first animated, full-color Walt Disney feature film.", a: "False", img: "Q33"),
        Question(q: "Beauty and the Beast was Disney’s first Broadway musical.", a: "True", img: "Q34"),
        Question(q: "Pepperoni is the most popular pizza topping in the US.", a: "True", img: "Q35"),
        Question(q: "Pineapples grow on trees.", a: "False", img: "Q36"),
        Question(q: "Hawaiian pizza comes from Canada.", a: "True", img: "Q37"),
        Question(q: "Only two men signed the Declaration of Independence on July 4, 1776.", a: "True", img: "Q38"),
        Question(q: "Santa Claus has his own postal code.", a: "True", img: "Q39"),
        Question(q: "Memorial Day has a special set of instructions regarding raising and lowering the U.S. flag.", a: "True", img: "Q40"),
        Question(q: "Football players started wearing helmets in 1943.", a: "True", img: "Q41"),
        Question(q: "Brazil is the only nation to have played in every World Cup finals tournament.", a: "True", img: "Q42"),
        Question(q: "There are 30 NFL teams.", a: "False", img: "Q43"),
        Question(q: "President George Washington brought macaroni and cheese to the USA.", a: "False", img: "Q44"),
        Question(q: "Marvel published its first comic in October 1939.", a: "True", img: "Q45"),
        Question(q: "Fortune cookies were invented in China.", a: "False", img: "Q46"),
        Question(q: "The Harry Potter film, Chamber of Secrets, is the longest film of the Harry Potter movies.", a: "True", img: "Q47"),
        Question(q: "The official color of the Golden Gate Bridge in California is Tennessee Orange.", a: "False", img: "Q48"),
        Question(q: "Dr. Pepper is the oldest soft drink in America.", a: "True", img: "Q49"),
        Question(q: "Infants have more bones than adults.", a: "True", img: "Q50")
        
        
    ]
    
    
    
    
    
    mutating func checkAnswer(userAnswer: String) -> Bool{
        let actualAnswer = self.quiz[questionNum].answer
        
        if actualAnswer == userAnswer{
            correctQuestionNum += 1
            return true
        } else {
            return false
        }
        
    }
    
    func getQuestionText() -> String {
        return quiz[questionNum].text
    }
    
    
    func getProgress() -> Float {
        return Float(questionNum + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion(){
        if questionNum < 10 {
            questionNum += 1
        } else {
            correctQuestionNum = 0
            questionNum = 0
            quiz.shuffle()
        }
    }
    
    mutating func getScore() -> String{
        return "Score: \(correctQuestionNum) / \(questionNum)"
    }
    
    func getImage() -> String{
        return quiz[questionNum].imgId
    }
    
    
}
