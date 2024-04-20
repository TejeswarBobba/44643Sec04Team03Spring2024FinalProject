//
//  CalendarVC.swift
//  Careconnect
//
//  Created by Tejeswar Bobba on 4/16/24.
//

import UIKit
import CalendarKit
import EventKit

class CalendarVC: DayViewController {
    private let eventStore = EKEventStore()
    private var patient:Patient = FireStoreOperations.getPatient(usr: FireStoreOperations.loginuser)
    let dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Appointment"
        print("patient load:\(patient)")
        requestAccessToCalendar()

        // Do any additional setup after loading the view.
    }
    
    func requestAccessToCalendar(){
//        eventStore.requestAccess(to: .event, completion: {
//            success, error in
//        })
        
        eventStore.requestFullAccessToEvents(completion: {
            success, error in
        })
    }
    
    override func eventsForDate(_ date: Date) -> [any EventDescriptor] {
        let calendar = Calendar.current
        
        var OneDayComponents = DateComponents()
        OneDayComponents.day = 1
        
        print("p rec:\(patient.Record)")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: patient.Record)

        print("start:\(startDate!.description)")
        let endDate = calendar.date(byAdding: OneDayComponents, to: startDate! )!
        
        guard calendar.isDate(date, inSameDayAs: startDate!) else {
                return []
            }
                
        let predicate = eventStore.predicateForEvents(withStart: startDate!, end: endDate, calendars: nil)
        let events = eventStore.events(matching: predicate)
        events.first?.title = "medical appointment"
        let calendarKitEvents = events.map(EKWrapper.init)
        
        
        
//        let ekevent = EKEvent()
//        ekevent.startDate = startDate
//        ekevent.endDate = endDate
//        ekevent.title = "medical appointment"
        
        

        return calendarKitEvents
       
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
