//
//  Model.swift
//  Shopcy
//
//  Created by Sai Dinesh Kopparthi on 2/5/24.
//

import Foundation
import FirebaseFirestore


struct Doctor: Codable{
    let name: String
    var patients: [String]
}

struct Patient: Codable{
    let Name: String
    let Prescription: String
    let Record:String
    let Symptoms:String
}




struct FireStoreOperations{
    
    static let db = Firestore.firestore()
    static var doctors: [Doctor] = []
    static var patients: [Patient] = []
    
    static var loginuser = ""
    
    public static func fetchDoctors() async{
            do{
                let doctordocs = try await db.collection("doctors").getDocuments().documents
                
                for doctor in doctordocs{
                    if doctor.exists {
                        let doc = doctor.data()
                        
                        let name = doc["name"] as? String ?? "N/A"
                        let patients = doc["patients"] as? [String] ?? [""]
                        
                        
                        let doct = Doctor(name: name, patients: patients)
                        doctors.append(doct)
                    } else{
                        print("Doctor does not exist")
                    }
                }
            } catch {
                print("Error getting document: \(error)")
            }
        
    }
    
    public static func fetchPatients() async{
            do{
                let doctordocs = try await db.collection("patients").getDocuments().documents
                
                for doctor in doctordocs{
                    if doctor.exists {
                        let doc = doctor.data()
                        
                        let name = doc["Name"] as? String ?? "N/A"
                        let prescription = doc["Prescription"] as? String ?? ""
                        let record = doc["Record"] as? String ?? ""
                        let symptoms = doc["Symptoms"] as? String ?? ""
                        
                        
                        let patient = Patient(Name: name, Prescription: prescription, Record: record, Symptoms: symptoms)
                        patients.append(patient)
                    } else{
                        print("patient does not exist")
                    }
                }
            } catch {
                print("Error getting document: \(error)")
            }
        
    }
    
    public static func getDoctor(usr:String) -> Doctor {
        let doc = try? doctors.first(where: { doc in
            doc.name == usr
        })
        print("ret doc: \(doc!)")
        return doc!
        
    }
    
    public static func getPatient(usr:String) -> Patient {
        
        let patient = try? patients.first(where: { pat in
            pat.Name == usr
        })
        print("ret patient: \(patient!)")
        return patient!
        
    }
    
    public static func deletepatient(usr:String){
        let collectionRef = db.collection("patients")
        let docRef = db.collection("doctors")

        // Specify the field name and value to query
        let name = "Name"
        let value = usr
        
        let doccol = "name"
        
        // Create a query to find documents where the specified field has the specified value
        let query = collectionRef.whereField(name, isEqualTo: value)
        
        let querydoc = docRef.whereField(doccol, isEqualTo: value)

        // Execute the query
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            // Loop through the documents and delete each one
            for document in documents {
                let documentID = document.documentID
                let documentRef = collectionRef.document(documentID)
                
                documentRef.delete { error in
                    if let error = error {
                        print("Error deleting document \(documentID): \(error)")
                    } else {
                        print("Document \(documentID) deleted successfully")
                    }
                }
            }
        }
        
        
        querydoc.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            // Loop through the documents and delete each one
            for document in documents {
                var newArray: [Any] = []
                if var existingArray = document.data()["patients"] as? [Any] {
                            // Check your condition and add the new element if the condition is met
                    newArray = existingArray.filter { $0 as! String != usr }
                    }
                
                let documentID = document.documentID
                let documentRef = docRef.document(documentID)
                
                        // Update the document with the modified array
                        documentRef.updateData(["patients": newArray]) { error in
                            if let error = error {
                                print("Error updating document: \(error)")
                            } else {
                                print("Document updated successfully!")
                            }
                        }
                
                
            }
        }
        
        
    }
    
    
    public static func createpatient(name:String, prescription:String, usr:String){
        let patname = name
        let collectionRef = db.collection("patients")
        let docdb = db.collection("doctors")

        // Create a dictionary containing the data
        let data: [String: Any] = [
            "Name": name,
            "Prescription": prescription
        ]

        // Add the data to a new document in the collection
        collectionRef.addDocument(data: data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully!")
            }
        }
        
        
        let name = "name"
        let value = usr
        

        // Create a query to find documents where the specified field has the specified value
        let query = docdb.whereField(name, isEqualTo: value)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            // Loop through the documents and delete each one
            for document in documents {
                var newArray: [Any] = []
                if var existingArray = document.data()["patients"] as? [Any] {
                            // Check your condition and add the new element if the condition is met
                                existingArray.append(patname)
                                print("item append")
                    newArray = existingArray
                    }
                
                let documentID = document.documentID
                let documentRef = docdb.document(documentID)
                
                        // Update the document with the modified array
                        documentRef.updateData(["patients": newArray]) { error in
                            if let error = error {
                                print("Error updating document: \(error)")
                            } else {
                                print("Document updated successfully!")
                            }
                        }
                
                
            }
        }
        
        
        
    }
    
    
    public static func createdoctor(data:[String:Any]){
        print("creating doctor")
        let collectionRef = db.collection("doctors")
        
        collectionRef.addDocument(data: data){ error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully!")
            }
        }
        
    }
    
    
}
