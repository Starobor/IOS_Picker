//
//  ViewController.swift
//  UIPickerView
//
//  Created by Citizen on 02.09.2018.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var levelLabel: UITextField!
    @IBOutlet weak var questionsLabel: UITextField!
    @IBOutlet weak var okButton: UIButton!
    let winLabel = UILabel()
    var correctAnswer = [Bool]()
    
    var numComponents: Int?
    var numComponentsRow: Int?
    var game = level.level_1
    var answer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numComponents ?? 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numComponentsRow ?? 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    @IBAction func changePickerButton(_ sender: Any) {
        switch game {
        case .level_1:
            setLevel1()
            game = .level_2
            checkCorrectAnswer()
        case .level_2:
            setLevel2()
            game = .level_3
        case .level_3:
            setLevel3()
            game = .level_4
        case .level_4:
            setLevel4()
            game = .level_5
        case .level_5:
            setLevel5()
            game = .end
        case .end:
            setEnd()
        }
    }
    
    
    enum level {
        case level_1
        case level_2
        case level_3
        case level_4
        case level_5
        case end
    }
    
    func startGame() {
        setLevel1()
        refreshPickerView()
    }
    
    func setLevel1() {
        levelLabel.text = "Level - 1"
        questionsLabel.text = "How many planets are there in the solar system"
        answer = "8"
        setPickerView(numComponents: 1, numComponentsRow: 101)
    }
    
    func setLevel2() {
        levelLabel.text = "Level - 2"
        questionsLabel.text = "How many 5³"
        answer = "125"
        setPickerView(numComponents: 3, numComponentsRow: 10)
    }
    
    func setLevel3() {
        let answers = ["Bil", "Leonardo", "Jack", "Gregory", "Pitter"]
        levelLabel.text = "Level - 3"
        questionsLabel.text = "Name of the protagonist from the movie Titanic?"
        answer = "Jack"
        setPickerView(numComponents: 1, numComponentsRow: answers.count)
    }
    
    func setLevel4() {
        levelLabel.text = "Level - 4"
        questionsLabel.text = "When the Second World War began?"
        answer = "1939"
        setPickerView(numComponents: 4, numComponentsRow: 10)
    }
    
    func setLevel5() {
        levelLabel.text = "Level - 5"
        questionsLabel.text = "Number of level?"
        answer = "5"
        setPickerView(numComponents: 1, numComponentsRow: 10)
    }
    
    
    func setEnd(){
        pickerView.removeFromSuperview()
        okButton.removeFromSuperview()
        levelLabel.removeFromSuperview()
        questionsLabel.removeFromSuperview()
        setWinLabel()
        print("win")
    }
    
    func setPickerDateView() {
        self.numComponents = 3
        self.numComponentsRow = 31
        refreshPickerView()
    }
    
    func setPickerView(numComponents: Int, numComponentsRow: Int) {
        self.numComponents = numComponents
        self.numComponentsRow = numComponentsRow
        refreshPickerView()
    }
    
    func refreshPickerView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    func setWinLabel() {
        let labelWidth = Int(view.bounds.width)
        let labelHeight = 50
        winLabel.text = "GAME END!"
        winLabel.textAlignment = .center
        winLabel.frame = CGRect(x: 0, y: (Int(view.bounds.height) - labelHeight)/2, width: labelWidth, height: labelHeight)
        self.view.addSubview(winLabel)
    }
    
    func checkCorrectAnswer() {
        if correct() {
            
        }
    }
    
    func correct() -> Bool {
        //TODO
        return false
    }

}

