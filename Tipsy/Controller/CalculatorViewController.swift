//
//  ViewController.swift
//  Tipsy
//
//  Created by Kittisak Panluea on 24/6/2565 BE.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTF: UITextField!
    
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    
    @IBOutlet weak var splitNumberLB: UILabel!
    
    var tip = Tip()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitNumberLB.text = "1"
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let tipTitle = sender.currentTitle ?? ""
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        
        sender.isSelected = true
        tip.setPctValue(pctValue: sender.currentTitle ?? "0%")
        
        //        replcingOccurences เหมือนกับฟังก์ชัน replace ใน js นั่นแหละ
        //        อันนี้คือเราจะให้มันตัดตัว % ออกแล้วทำการแปลงค่าจาก string ไปเป็น float แล้วหารด้วย 100
        //        let tipTitlewithoutPercentage = tipTitle.replacingOccurrences(of: "%", with: "")
        //         หรือจะใช้ dropLast เพื่อลบข้อความตัวสุดท้ายทิ้งก้ด๊ะ
        let tipTitlewithoutPercentage = tipTitle.dropLast()
        let tipChange = (Float(tipTitlewithoutPercentage) ?? Float("0.0")!) / 100
//        หรือจะยกเลิกคีย์บอร์ดแบบนี้ก็ได้แต่แบบนี้มันต้องไปกดปุ่มอื่นถึงจะปิดคีย์บอร์ด แต่วิธีล่างสุดคือกดตรงไหนก็ได้นอกคีย์บอร์ด
//        billTF.endEditing(true)
        
        tip.setTipChange(tipChange: tipChange)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue:Int = Int(sender.value)
        tip.setSplitNumber(number:stepperValue)
        splitNumberLB.text = String(stepperValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let splitNumberToInt = Int(splitNumberLB.text!)!
        tip.setResultOfTip(splitNumber:splitNumberToInt , bill:billTF.text ?? "0.0")
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //    ปิดคีย์บอร์ดเวลากดที่บริเวณนอกคีย์บอร์ด
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destination = segue.destination as! ResultViewController
            destination.totalTip = tip.getResultOfTip()
            destination.totalPeople = tip.getSplitNumber()
            destination.totalTipPercentage = tip.getPctValue()
        }
    }
    
}

