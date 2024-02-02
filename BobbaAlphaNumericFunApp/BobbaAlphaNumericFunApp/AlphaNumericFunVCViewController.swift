//
//  AlphaNumericFunVCViewController.swift
//  BobbaAlphaNumericFunApp
//
//  Created by Tejeswar Bobba on 2/1/24.
//

import UIKit

class AlphaNumericFunVCViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
    }
    
    @IBOutlet weak var headerLBL: UILabel!
    
    @IBOutlet weak var firstNumberLBL: UILabel!
    
    @IBOutlet weak var secondNumberLBL: UILabel!
    
    
    @IBOutlet weak var headerSV: UIStackView!
    
    
    @IBOutlet weak var numbersSV: UIStackView!
    
    @IBOutlet weak var stringsSV: UIStackView!
    
    
    @IBOutlet weak var outputResetSV: UIStackView!
    
    
    @IBOutlet weak var launchLAV: UIView!
    
    
    @IBOutlet weak var categorySC: UISegmentedControl!
    
    @IBOutlet weak var inputStringTF: UILabel!
    
    
    @IBOutlet weak var lowerCaseSWCH: UISwitch!
    
    @IBOutlet weak var upperCaseSWCH: UISwitch!
    
    
    @IBOutlet weak var firstNumberStepper: UIStepper!
    
    @IBOutlet weak var secondNumberStepper: UIStepper!
    
    
    @IBOutlet weak var outputTV: UITextView!
    
    
    @IBAction func selectCategory(_ sender: UISegmentedControl) {
    }
    
    @IBAction func upperCaseString(_ sender: UISwitch) {
    }
    
    @IBAction func lowerCaseString(_ sender: UISwitch) {
    }
    
    
    @IBAction func updateFirstNumber(_ sender: UIStepper) {
    }
    
    
    @IBAction func updateSecondNumber(_ sender: UIStepper) {
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
