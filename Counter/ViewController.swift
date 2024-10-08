//
//  ViewController.swift
//  Counter
//
//  Created by Артем Табенский on 06.10.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var changeHistoryView: UITextView!
    private var touchCount: UInt = 0
    private var changeHistory: String = "История изменений: \n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeHistoryView.isEditable = false
    }

    @IBAction private func addButtonTouched() {
        touchCount += 1
        counterLabel.text = "Значение счётчика: \(touchCount)"
        changeHistory += "\(Date().formatted(date: .numeric, time: .standard)): значение изменено на +1 \n"
        changeHistoryView.text = changeHistory
    }
    
    @IBAction private func decreaseButtonTouched() {
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
    @IBAction private func resetButtonTouched() {
        touchCount = 0
        counterLabel.text = "Значение счётчика: \(touchCount)"
        changeHistory += "\(Date().formatted(date: .numeric, time: .standard)): значение сброшено \n"
        changeHistoryView.text = changeHistory
    }
    
}

