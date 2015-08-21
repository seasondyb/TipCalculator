//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Yibo Dai on 8/9/15.
//  Copyright (c) 2015 Yibo Dai. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {

    //MARK: - IBOutlet
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberofPeopleTextField: UITextField!
    @IBOutlet weak var myResultLabel: UILabel!
    
    
    //MARK: - Properties
    var tipCalc = TipCalc ()
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTextField.text = String()
        tipPercentageLabel.text = String(format: "Tip %d%%:", arguments: [Int(tipCalc.tipPercentage * 100)])
    }
    
    // Do any additional setup after loading the view.
    func calcTip () {
        tipCalc.tipPercentage = Float(tipPercentageSlider.value)
        tipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text) as NSString).floatValue
        tipCalc.calculateTip()
        updateUI()
    }
    
    func calcMyBill () {
        tipCalc.numberOfPeople = ((numberofPeopleTextField.text) as NSString).integerValue
        tipCalc.calculateMyBill()
        updateUIMyResult()
    }
    
    func updateUI() {
        resultLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", arguments: [tipCalc.totalAmount, tipCalc.tipAmount])
    }
    
    func updateUIMyResult() {
        myResultLabel.text = String(format: "My total is $%0.2f Tip: $%0.2f", arguments: [tipCalc.myTotalAmount, tipCalc.myTipAmount])
    }
    
    //MARK: - UIControl Events
    
    //This is a function of Tip text field delegate
    @IBAction func amountBeforeTextFieldChange(sender: AnyObject) {
//        calcTip()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == amountBeforeTaxTextField {
            textField.resignFirstResponder()
            calcTip()
        } else if textField == numberofPeopleTextField {
            textField.resignFirstResponder()
            calcMyBill()
        }
        return true
    }
    @IBAction func tipPercentageSliderValueChanged(sender: AnyObject) {
        //update text of Tip% label
        tipPercentageLabel.text = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calcTip()
    }
    
    
    
}

