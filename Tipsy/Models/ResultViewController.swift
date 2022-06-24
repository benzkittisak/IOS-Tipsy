//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Kittisak Panluea on 24/6/2565 BE.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLB: UILabel!
    @IBOutlet weak var settingsLB: UILabel!
    
    var totalTip:Float? = 0.0
    var totalPeople:Int? = 0
    var totalTipPercentage:String? = "0%"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let totalLBFormatted = String(format: "%0.2f", totalTip!)
        totalLB.text = totalLBFormatted
        settingsLB.text = "Split between \(totalPeople!) people. with \(totalTipPercentage!) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
