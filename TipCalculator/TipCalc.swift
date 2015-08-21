//
//  TipCalc.swift
//  TipCalculator
//
//  Created by Yibo Dai on 8/9/15.
//  Copyright (c) 2015 Yibo Dai. All rights reserved.
//

import Foundation

class TipCalc {

    var tipAmount: Float = 0
    var amountBeforeTax: Float
    var tipPercentage: Float
    var totalAmount: Float = 0
    var numberOfPeople: Int = 1
    var myTotalAmount: Float = 0
    var myTipAmount: Float = 0
    
    init(){
        self.amountBeforeTax = 0
        self.tipPercentage = 0
    }

    func calculateTip () {
        tipAmount = tipPercentage * amountBeforeTax
        totalAmount = tipAmount + amountBeforeTax
    }
    
    func calculateMyBill () {
        myTotalAmount = totalAmount/Float(numberOfPeople)
        myTipAmount = tipAmount/Float(numberOfPeople)
    }
    
}