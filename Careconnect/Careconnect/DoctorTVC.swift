//
//  DoctorTVC.swift
//  Careconnect
//
//  Created by Tejeswar Bobba on 4/13/24.
//

import UIKit



class DoctorTVC: UITableViewController {
    let auth = AuthenticationManager.shared
    var usr = String()
    var doctors = FireStoreOperations.doctors
    var doctor = Doctor(name: "", patients: [""])
    var patients = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Doctors:\(doctors)")
        print("loginuser:\(FireStoreOperations.loginuser)")
        
        doctor = doctors.first(where: { doc in
            doc.name == FireStoreOperations.loginuser
        })!
        
        patients = doctor.patients
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return doctor.patients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Doctor", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = patients[indexPath.row]
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        doctor.name
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete the patient", handler: {
            _, _, _ in
            
            let n = self.patients[indexPath.row]
            self.patients.remove(at: indexPath.row)
            self.doctor.patients = self.patients
            tableView.deleteRows(at: [indexPath], with: .none)
            FireStoreOperations.deletepatient(usr: n)
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
   
    @IBAction func logout(_ sender: UIButton) {
        
            performSegue(withIdentifier: "docToLogin", sender: self)
            print("doc logout")
            try? auth.signOut()
            
    }
    
    
    @IBAction func addpatient(_ sender: UIButton) {
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
