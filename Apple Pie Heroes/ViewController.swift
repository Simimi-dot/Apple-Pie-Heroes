//
//  ViewController.swift
//  Apple Pie Heroes
//
//  Created by Егор Астахов on 30.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    
    
    // MARK: - Properties
    var currentGame: Game! // Создали переменную currentGame типа Game из другого файла. Значение опциональное но, работаем так, как будто оно всегда имеет значение благодаря !  .
    let incorrectMovesAllowed = 7 // Максимальное количество неправильных ходов.
    var listOfHeroes = [
        "Anti-Mage",
        "Axe",
        "Crystal Maiden",
        "Dazzle",
        "Drow Ranger",
        "Earthshaker",
        "Lich",
        "Lina",
        "Lion",
        "Mirana",
        "Morphling",
        "Necrophos",
        "Puck",
        "Pudge",
        "Razor",
        "Sand King",
        "Shadow Shaman",
        "Storm Spirit",
        "Sven",
        "Tidehunter",
        "Vengeful Spirit",
        "Windranger",
        "Witch Doctor",
        "Zeus",
        "Slardar",
        "Enigma",
        "Faceless Void",
        "Tiny",
        "Viper",
        "Venomancer",
        "Clockwerk",
        "Nature's Prophet",
        "Dark Seer",
        "Sniper",
        "Pugna",
        "Beastmaster",
        "Enchantress",
        "Leshrac",
        "Shadow Fiend",
        "Tinker",
        "Weaver",
        "Night Stalker",
        "Ancient Apparition",
        "Spectre",
        "Doom",
        "Chen",
        "Juggernaut",
        "Bloodseeker",
        "Kunkka",
        "Riki",
        "Queen of Pain",
        "Wraith King",
        "Broodmother",
        "Huskar",
        "Jakiro",
        "Batrider",
        "Omniknight",
        "Dragon Knight",
        "Warlock",
        "Alchemist",
        "Lifestealer",
        "Death Prophet",
        "Ursa",
        "Bounty Hunter",
        "Silencer",
        "Spirit Breaker",
        "Invoker",
        "Clinkz",
        "Outworld Devourer",
        "Bane",
        "Shadow Demon",
        "Lycan",
        "Lone Druid",
        "Brewmaster",
        "Phantom Lancer",
        "Treant Protector",
        "Ogre Magi",
        "Gyrocopter",
        "Chaos Knight",
        "Phantom Assassin",
        "Rubick",
        "Luna",
        "Io",
        "Undying",
        "Disruptor",
        "Templar Assassin",
        "Naga Siren",
        "Nyx Assassin",
        "Keeper of the Light",
        "Visage",
        "Meepo",
        "Magnus",
        "Centaur Warrunner",
        "Slark",
        "Timbersaw",
        "Medusa",
        "Troll Warlord",
        "Tusk",
        "Bristleback",
        "Skywrath Mage",
        "Elder Titan",
        "Abaddon",
        "Ember Spirit",
        "Earth Spirit",
        "Legion Commander",
        "Phoenix",
        "Terrorblade",
        "Techies",
        "Oracle",
        "Winter Wyvern",
        "Arc Warden",
        "Underlord",
        "Monkey King",
        "Dark Willow",
        "Pangolier",
        "Grimstroke",
        "Mars",
        "Snapfire",
        "Void Spirit",
    ]
    
    var totalWins = 0
    var totalLoses = 0
    
    
    // MARK: - Methods
    
    func newRound() {
        let newWord = listOfHeroes.removeFirst() // Удаляем из массива первое слово и оно же возвращается в константу newWord. Это слово и будет загаданным.
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateCorrectWord() {
        var displayWord = [String]() // Создаем пустой массив строк
        for letter in currentGame.guessedWord{ // Проходим буквенно по guessedWord
            displayWord.append(String(letter)) // Добавляем буквы в этот массив строк
        }
        correctWordLabel.text = displayWord.joined(separator: " ") // Текст, который мы создаем, получаем из массива displayWord соединяя вместе всего его элементы через " "
        
    }
    
    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNumber = (movesRemaining + 64) % 8 // Прибавить 64 и взять остаток от деления на 8
        let imgae = "Tree\(imageNumber)" // Связываем название картинок дерева с количеством оставшихся попыток.
        treeImageView.image = UIImage(named: imgae)
        updateCorrectWord()
        scorelabel.text = "Выигрыши: \(totalWins), Проигрыши: \(totalLoses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    
    
    
    // MARK: - IB Actions
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        sender.alpha = 0.3
        let letter = sender.title(for: .normal)! // Извлекаем букву при угадывании слова
        currentGame.playerGuessed(letter: Character(letter))
        updateUI()
    }
    
    
}

