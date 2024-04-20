//
//  PatientVC.swift
//  Careconnect
//
//  Created by Tejeswar Bobba on 4/14/24.
//

import UIKit

let auth = AuthenticationManager.shared

class PatientVC: UIViewController {
    var usr = FireStoreOperations.loginuser
    var patient = Patient(Name: "", Prescription: "", Record: "", Symptoms: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        print("patient:\(usr)")
        patient = FireStoreOperations.getPatient(usr: usr)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showPrescription"){
            let prescriptionVC = segue.destination as? PrescriptionVC
            prescriptionVC?.prescription = patient.Prescription
        }
    }
    
    
    
    
    @IBAction func logout(_ sender: UIButton) {
       try? auth.signOut()
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
