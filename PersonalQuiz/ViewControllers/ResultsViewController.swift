//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим живтным
    // 4. Избавится от кнопки возврата назад на экран результатов

    var readyAnswers: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
