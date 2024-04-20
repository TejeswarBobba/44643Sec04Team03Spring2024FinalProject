//
//  PrescriptionVC.swift
//  Careconnect
//
//  Created by Tejeswar Bobba on 4/17/24.
//

import UIKit
import CareKit
import CareKitStore
import SwiftUI


let storeName = "careconnect"
let store = OCKStore(name: storeName)
let manager = OCKSynchronizedStoreManager(wrapping: store)
let careViewController = OCKDailyTasksPageViewController(storeManager: manager)


class PrescriptionVC: UIViewController {
    
    var prescription = String()
    
    

        override func viewDidLoad() {
            super.viewDidLoad()
            let medicine = String(prescription.split(separator: " ")[0].description)
            let time = String(prescription.split(separator: " ")[1].description)
            let startOfDay = Calendar.current.startOfDay(for: Date())
            let atBreakfast = Calendar.current.date(byAdding: .hour, value: Int(time)!, to: startOfDay)!

            let dailyAtBreakfast = OCKScheduleElement(start: atBreakfast, end: nil, interval: DateComponents(day: 1))

            var schedule = OCKSchedule(composing: [dailyAtBreakfast])
            
            var task = OCKTask(id: medicine, title: medicine, carePlanID: nil, schedule: schedule)

            task.instructions = "Take 25mg of doxylamine when you experience nausea."
            store.addTasks([task],
                           callbackQueue: DispatchQueue.main,
                           completion: { (result: (Result<[OCKTask], OCKStoreError>)) in
                                    switch result {
                                    case .failure(let error) :
                                        print(error.localizedDescription)
                                    case .success( _) :
                                        print("Success!")
                                    }
                    })
            

            // Initialize the care plan store
            
        }
    
    override func viewDidAppear(_ animated: Bool) {
        print("prescription:\(prescription)")
        self.present(careViewController, animated: true, completion: nil)
    }
    
}


