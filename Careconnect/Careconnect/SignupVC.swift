//
//  SignupVC.swift
//  Careconnect
//
//  Created by Tejeswar Bobba on 4/13/24.
//

import UIKit

class SignupVC: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var reenterpassword: UITextField!
    
    
    @IBOutlet weak var doctororpatient: UISegmentedControl!
    
    let auth = AuthenticationManager.shared

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        
        Task { @MainActor in
            let username = username.text
            let password = password.text
            let doctororpatient = doctororpatient.selectedSegmentIndex
            
            if(doctororpatient == 0){
                
                do{
                    try await auth.createUser(email: username!, password: password!)
                    let doctordata = [
                        "name": username?.split(separator: "@").first?.lowercased(),
                        "patients":[]
                    
                    ]
                   
                    FireStoreOperations.createdoctor(data: doctordata)
                    performSegue(withIdentifier: "signupToLogin", sender: self)
                }catch{
                    print("login unsuccessful")
                }
                
            }else if(doctororpatient == 1){
                do{
                    try await auth.createUser(email: username!, password: password!)
                   
                    performSegue(withIdentifier: "signupToLogin", sender: self)
                }catch{
                    print("signup unsuccessful")
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
