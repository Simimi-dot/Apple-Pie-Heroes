//
//  Game.swift
//  Apple Pie Heroes
//
//  Created by Егор Астахов on 30.10.2020.
//

struct Game {
    var word: String // Слово, которое сейчас угадывается
    var incorrectMovesRemaining: Int // Количество попыток, которое осталось
    fileprivate var guessedLetters = [Character]() // Массив букв, который содержит список угаданных букв, которых пользователь пытался угадать
    
    init(word:String, incorrectMovesRemaining:Int) {
        self.word = word
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    var guessedWord:String{ // Угаданное слово
        var wordToShow = ""
        for letter in word{
            if guessedLetters.contains(Character(letter.lowercased())) || letter == "-" || letter == " " || letter == "'"{
                wordToShow += String(letter)
            }else{
                wordToShow += "_"
            }
        }
        return wordToShow
    }
    
    
    mutating func playerGuessed(letter: Character) {
        let lowercasedLetter = Character(letter.lowercased())
        guessedLetters.append(lowercasedLetter)
        if !word.lowercased().contains(lowercasedLetter){
            incorrectMovesRemaining -= 1
        }
    }
    
    
}
