//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 4. Избавится от кнопки возврата назад на экран результатов

    @IBOutlet weak var animalTipeLabel: UILabel!
    @IBOutlet weak var animalTipeDescription: UILabel!
    
    var readyAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = choosingResult(answers: readyAnswers)
        animalTipeLabel.text = "Вы - \(result.rawValue)!"
        animalTipeDescription.text = result.definition
    }
    
    
}

extension ResultsViewController {
    private func choosingResult (answers: [Answer]) -> AnimalType {
        var sortedAnswers: [AnimalType: Int] = [AnimalType.cat: 0,
                                                AnimalType.dog: 0,
                                                AnimalType.rabbit: 0,
                                                AnimalType.turtle: 0]
        var resultAnimalTipe: AnimalType = .turtle
        for answer in answers {
            switch answer.type {
            case .cat:
                if sortedAnswers[.cat] != nil {
                    sortedAnswers[.cat]! += 1
                }
            case .dog:
                if sortedAnswers[.dog] != nil {
                    sortedAnswers[.dog]! += 1
                }
            case .rabbit:
                if sortedAnswers[.rabbit] != nil {
                    sortedAnswers[.rabbit]! += 1
                }
            case .turtle:
                if sortedAnswers[.turtle] != nil {
                    sortedAnswers[.turtle]! += 1
                }
            }
        }
        
        for answer in sortedAnswers {
            if answer.value == sortedAnswers.values.max() {
                resultAnimalTipe = answer.key
                break
            }
        }
        
return resultAnimalTipe
    }
}
