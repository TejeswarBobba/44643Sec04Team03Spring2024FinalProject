//
//  LoginVC.swift
//  Careconnect
//
//  Created by Tejeswar Bobba on 4/13/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var doctororpatient: UISegmentedControl!
    
    let auth = AuthenticationManager.shared
    
    var usr = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        Task { @MainActor in
            let username = username.text
            let password = password.text
            let doctororpatient = doctororpatient.selectedSegmentIndex
            
            if(doctororpatient == 0){
                
                do{
                    
                    Task{
                        @MainActor in
                        await FireStoreOperations.fetchDoctors()
                    }
                    try await auth.signIn(email: username!, password: password!)
                    FireStoreOperations.loginuser = String((auth.getCurrentUser().email?.split(separator: "@").first)!)
                    
                    performSegue(withIdentifier: "showDoctorDetails", sender: usr)
                }catch{
                    print("login unsuccessful")
                }
                
            }else if(doctororpatient == 1){
                do{
                    Task{
                        @MainActor in
                        await FireStoreOperations.fetchPatients()
                    }
                    try await auth.signIn(email: username!, password: password!)
                    FireStoreOperations.loginuser = String((auth.getCurrentUser().email?.split(separator: "@").first)!)
                    performSegue(withIdentifier: "showPatientDetails", sender: self)
                }catch{
                    print("login unsuccessful")
                }
            }else{
                
            }
            
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
