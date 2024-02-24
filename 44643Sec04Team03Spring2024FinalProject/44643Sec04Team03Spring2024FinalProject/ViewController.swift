//
//  ViewController.swift
//  44643Sec04Team03Spring2024FinalProject
//
//  Created by Tejeswar Bobba on 2/20/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func login(_ sender: UIButton) {
        guard let username = usernameTF.text, !username.isEmpty else {
                    //need to implement code here
                    return
                }

                guard let password = passwordTF.text, !password.isEmpty else {
                    //need to implement code here
                    return
                }
    }
    
    @IBAction func signUP(_ sender: UIButton) {
    }
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
}

