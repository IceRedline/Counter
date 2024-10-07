//
//  ViewController.swift
//  Counter
//
//  Created by Артем Табенский on 06.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var changeHistoryView: UITextView!
    var touchCount: UInt = 0
    var changeHistory: String = "История изменений: \n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeHistoryView.isEditable = false
    }

    @IBAction func addButtonTouched() {
        touchCount += 1
        counterLabel.text = "Значение счётчика: \(touchCount)"
        changeHistory += "\(Date().formatted(date: .numeric, time: .standard)): значение изменено на +1 \n"
        changeHistoryView.text = changeHistory
    }
    
    @IBAction func decreaseButtonTouched() {
        if touchCount > 0 {
            touchCount -= 1
            counterLabel.text = "Значение счётчика: \(touchCount)"
            changeHistory += "\(Date().formatted(date: .numeric, time: .standard)): значение изменено на -1 \n"
            changeHistoryView.text = changeHistory
        } else {
            changeHistory += "\(Date().formatted(date: .numeric, time: .standard)): попытка уменьшить значение счётчика ниже 0 \n"
            changeHistoryView.text = changeHistory
        }
    }
    @IBAction func resetButtonTouched() {
        touchCount = 0
        counterLabel.text = "Значение счётчика: \(touchCount)"
        changeHistory += "\(Date().formatted(date: .numeric, time: .standard)): значение сброшено \n"
        changeHistoryView.text = changeHistory
    }
    
}

