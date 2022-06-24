//
//  Tip.swift
//  Tipsy
//
//  Created by Kittisak Panluea on 24/6/2565 BE.
//

import Foundation

struct Tip {
    var tipChange:Float = 0.0
    var resultOfTip:Float = 0.0
    var splitNumber:Int = 0
    var pctValue = "0%"
    
    mutating func setTipChange(tipChange:Float){
        self.tipChange = tipChange
    }
    
    mutating func setResultOfTip(splitNumber:Int , bill:String){
        
        let convertBillToFloat:Float = Float(bill)!
        let tipWithPercentage =  convertBillToFloat + ( convertBillToFloat * tipChange )
        let resultOfTip = tipWithPercentage / Float(splitNumber)
        
        self.resultOfTip = resultOfTip
    }
    
    mutating func setSplitNumber(number:Int){
        self.splitNumber = number
    }
    
    mutating func setPctValue(pctValue:String){
        self.pctValue = pctValue
    }
    
    
    func getTipChange() -> Float{
        return tipChange
    }
    
    func getResultOfTip() -> Float{
        return resultOfTip
    }
    
    func getSplitNumber() -> Int {
        return splitNumber
    }
    
    func getPctValue() -> String{
        return pctValue
    }
}
