//
//  AddPatientVC.swift
//  Careconnect
//
//  Created by Tejeswar Bobba on 4/19/24.
//

import UIKit

class AddPatientVC: UIViewController {
    
    @IBOutlet weak var patient: UITextField!
    
    
    @IBOutlet weak var medicine: UITextField!
    
    
    @IBOutlet weak var time: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addPatient(_ sender: UIButton) {
        let name = patient.text!
        let prescrption = medicine.text! + " " + time.text!
        
        FireStoreOperations.createpatient(name: name, prescription: prescrption, usr: FireStoreOperations.loginuser)
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
