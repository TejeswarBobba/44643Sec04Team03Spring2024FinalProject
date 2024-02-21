//
//  AlphaNumericFunVCViewController.swift
//  BobbaAlphaNumericFunApp
//
//  Created by Tejeswar Bobba on 2/1/24.
//

import UIKit
import AudioToolbox
import AnimatedGradientView
import Lottie

class AlphaNumericFunVCViewController: UIViewController {

    override func viewDidLoad() {
                       super.viewDidLoad()
                       self.headerLBL.text = String(format: "%@\nHAVE SOME FUN™️","\u{0C38}\u{0C2D}\u{0C15}\u{0C41}\u{0C28}\u{0C2E}\u{0C38}\u{0C4D}\u{0C15}\u{0c3E}\u{0C30}\u{0c02}")
        self.categorySC.isUserInteractionEnabled = true
                       self.categorySC.isEnabled = true
//                        numbersSV.isUserInteractionEnabled = true
                        inputStringTF.isEnabled = false
                        lowercaseSWCH.isOn = false
                        uppercaseSWCH.isOn = false
                        lowercaseSWCH.isEnabled = false
                        uppercaseSWCH.isEnabled = false
                        categorySC.selectedSegmentIndex = -1
                        outputTV.text = "Welcome!\n\nInteract with the UI elements and have some fun with numbers and strings,and patterns that are generated using them."
        applygradientview()
        applytoborders(to: numbersSV)
        applytoborders(to: stringsSV)
        applytoborders(to: headerSV)
        applytoborders(to: outputResetSV)
                        
        
        
        //Bonus
        print("1.In auto layout the attributes are of width height trailing etc.. and these are used for view positions and layout.")
        print("2.Stack views in auto layout is a container which manges the layout and spacing of views.")
        print("3.Control-dagging method is used for interface builder and also used for positioning and sizing of UI.")
        print("4.The purporse of auto layout tools were used to fix the layout and their alignment issues.")
        // Do any additional setup after loading the view.
        
    }
    
    
    func applygradientview(){
        let gradientType: CAGradientLayerType = .axial
                let direction: AnimatedGradientViewDirection = .down
                let animatedGradient = AnimatedGradientView(frame: self.view.bounds)
                animatedGradient.animationValues = [
                    (colors: ["feafbd","ac2b5e"],direction,gradientType),
                    (colors: ["42475a","bdc3c4"],direction,gradientType),
                    (colors: ["df6162","db5e79"],direction,gradientType),
                    (colors: ["06bab6","2093b0"],direction,gradientType),
                ]
                self.view.insertSubview(animatedGradient, at:0)
    }
    
    func applytoborders(to elem: UIView){
        elem.layer.borderWidth = 0.5
        elem.layer.cornerRadius = 5.0
        elem.layer.borderColor = UIColor.black.cgColor
       }
    
    @IBOutlet weak var headerLBL: UILabel!
    
    @IBOutlet weak var firstNumberLBL: UILabel!
    
    @IBOutlet weak var secondNumberLBL: UILabel!
    
    
    @IBOutlet weak var headerSV: UIStackView!
    
    
    @IBOutlet weak var numbersSV: UIStackView!
    
    @IBOutlet weak var stringsSV: UIStackView!
    
    
    @IBOutlet weak var outputResetSV: UIStackView!
    
    
    @IBOutlet weak var launchLAV: LottieAnimationView!
    
    
    @IBOutlet weak var categorySC: UISegmentedControl!
    
    
    @IBOutlet weak var inputStringTF: UITextField!
    
    @IBOutlet weak var lowercaseSWCH: UISwitch!
    
    @IBOutlet weak var uppercaseSWCH: UISwitch!
    
    
    @IBOutlet weak var firstNumberStepper: UIStepper!
    
    @IBOutlet weak var secondNumberStepper: UIStepper!
    
    
    @IBOutlet weak var outputTV: UITextView!
    
    @IBAction func reset(_ sender: UIButton) {
    }
    
    func show(){
        var txt = inputStringTF.text
        let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
        var refstring = CharacterSet(charactersIn:chars)
        var origstring = CharacterSet(charactersIn:txt!)
        
        var t = origstring.isSubset(of: refstring)
        if(t){
            let vowelsstring = "AEIOUaeiou"
            var vc = txt!.filter { vowelsstring.contains($0) }.count
            var cc = txt!.count - vc
            let pali = txt == String(txt!.reversed())
                            var str = ""
                            if pali{
                                str += "Given String \"\(txt)\" is a Palindrome \n"
                            }
                            else{
                                str += "Given String \"\(txt)\" is a Palindrome \n"
                            }
                            str += "Count of consonants in \"\(txt)\" is \(cc) \n"
                            str += "Count of vowels in \"\(txt)\" is \(vc) \n"
            str += "Count of unique characters in \"\(String(describing: txt))\" is \(Set(String(describing: txt)).count) \n"
                            str += "The reversal of \"\(txt)\" results in \"\(String(txt!.reversed()))\" \n"
                            outputTV.text = str
        }else{
            outputTV.text = ("❌ Invalid String. ❌ Please input a String without special characters and numerics.")
        }
    }
    
    @IBAction func respondToValueChange(_ sender: UITextField) {
        show()
    }
    
    @IBAction func selectCategory(_ sender: UISegmentedControl) {
        AudioServicesPlaySystemSound(1104)
        let selectSeg = categorySC.selectedSegmentIndex
        print(selectSeg)
        switch selectSeg{
        case 0 :
            firstNumberLBL.text = "0"
            secondNumberLBL.text = "0"
            firstNumberStepper.value = 0
            secondNumberStepper.value = 0
            numbersSV.isUserInteractionEnabled = true
            inputStringTF.isEnabled = false
            inputStringTF.placeholder = "Input a String"
            lowercaseSWCH.isEnabled = false
            uppercaseSWCH.isEnabled = false
            inputStringTF.text = ""
            outputTV.text = "Use the 1st number stepper to increment the number value."
        case 1:
            inputStringTF.isEnabled = true
            inputStringTF.placeholder = "Please provide atleast one character"
            lowercaseSWCH.isEnabled = true
            uppercaseSWCH.isEnabled = true
            inputStringTF.text = ""
            numbersSV.isUserInteractionEnabled = false
            firstNumberLBL.text = "0"
            secondNumberLBL.text = "0"
            firstNumberStepper.value = 0
            secondNumberStepper.value = 0
            lowercaseSWCH.isOn = false
            uppercaseSWCH.isOn = false
            outputTV.text = ""
        case 2:
            firstNumberLBL.text = "0"
            secondNumberLBL.text = "0"
            firstNumberStepper.value = 0
            secondNumberStepper.value = 0
            numbersSV.isUserInteractionEnabled = true
            inputStringTF.isEnabled = false
            inputStringTF.placeholder = "Input a String"
            lowercaseSWCH.isEnabled = false
            uppercaseSWCH.isEnabled = false
            inputStringTF.text = ""
            outputTV.text = "Use the 1st number stepper to increment the number value."
        default:
            break
            
        }
    }
    @IBAction func uppercaseString(_ sender: UISwitch) {
        AudioServicesPlaySystemSound(1105)
        lowercaseSWCH.isOn=false
        var txt = inputStringTF.text?.uppercased()
        inputStringTF.text = txt
        show()
    }
    
    @IBAction func lowercaseString(_ sender: UISwitch) {
        AudioServicesPlaySystemSound(1105)
        uppercaseSWCH.isOn=false
        var txt = inputStringTF.text?.lowercased()
        inputStringTF.text = txt
        show()
    }
    
    
    @IBAction func updateFirstNumber(_ sender: UIStepper) {
        var f = Int(firstNumberStepper.value).description
        var s = Int(firstNumberStepper.value).description
        self.firstNumberLBL.text = f
        self.secondNumberLBL.text = s
        var fi = Int(firstNumberLBL.text!)!
        var sc = Int(secondNumberLBL.text!)!
        if sc != 0 {
            if categorySC.selectedSegmentIndex == 0{
                            outputTV.text = "Concatenation of two numbers is\"\(fi)\(sc)\"\n square and cube of \(fi) are \(fi * fi) and \(fi * fi * fi), respectively. \n Square and cube of \(sc) are \(sc * sc) and \(sc * sc * sc), respectively. \n Binary representation of \(fi) is \(String(fi, radix: 2)). \n Binary representation of \(sc) is \(String(sc, radix: 2))."
                        }
                        else{
                            var patternoutput = ""
                            for i in 0..<fi{
                                var fir = ""
                                for j in 0..<sc{
                                    if(i==0 || j==0 || i==fi-1 || j==sc-1){
                                        fir += "⭐️"
                                    }else if(i + j) % 2 == 0 {
                                        fir += "🔲"
                                    }
                                     else {
                                         fir += "⬛️"
                                     }
                                 }
                                patternoutput += fir + "\n"
                             }
                                outputTV.text = patternoutput
                                }
                            
                        
        }else{
            outputTV.text = "Use the 2nd number stepper to increment the number value"

        }
        
    }
    
    
    @IBAction func updateSecondNumber(_ sender: UIStepper) {
        
        var f = Int(firstNumberStepper.value).description
        var s = Int(firstNumberStepper.value).description
        self.firstNumberLBL.text = f
        self.secondNumberLBL.text = s
        var fi = Int(firstNumberLBL.text!)!
        var sc = Int(secondNumberLBL.text!)!
        if fi != 0 {
            if categorySC.selectedSegmentIndex == 0{
                            outputTV.text = "Concatenation of two numbers is\"\(fi)\(sc)\"\n square and cube of \(fi) are \(fi * fi) and \(fi * fi * fi), respectively. \n Square and cube of \(sc) are \(sc * sc) and \(sc * sc * sc), respectively. \n Binary representation of \(fi) is \(String(fi, radix: 2)). \n Binary representation of \(sc) is \(String(sc, radix: 2))."
                        }
                        else{
                            var patternoutput = ""
                            for i in 0..<fi{
                                var fir = ""
                                for j in 0..<sc{
                                    if(i==0 || j==0 || i==fi-1 || j==sc-1){
                                        fir += "⭐️"
                                    }else if(i + j) % 2 == 0 {
                                        fir += "🔲"
                                    }
                                     else {
                                         fir += "⬛️"
                                     }
                                 }
                                patternoutput += fir + "\n"
                             }
                                outputTV.text = patternoutput
                                }
                            
                        
        }else{
            outputTV.text = "Use the 1st number stepper to increment the number value"

        }
        
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
