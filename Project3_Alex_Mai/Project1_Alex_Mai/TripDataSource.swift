//
//  TripDataSource.swift
//  Project3_Alex_Mai
//
//  Created by Alex Mai on 12/8/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit
import CoreData

class TripDataSource: NSObject {
    var trips: [Trip]
//    let fetchRequest = NSFetchRequest<Account>(entityName: "Account")
    
    override init() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = delegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<Trip>(entityName: "Trip")
            
            do {
                trips = try managedContext.fetch(fetchRequest)
            }
            catch let error as NSError {
                print("Failed to load persistent data. \(error), \(error.userInfo)")
                trips = [Trip]()
            }
        }
        else {
            trips = [Trip]()
        }
        
        super.init()
    }
    
    
    //
    // MARK: entree management (creation and persistence)
    //
    
    func getUserTrips() -> [Trip]{
        let login = AccountDataSource.whoAmI
        
        var userTrips = [Trip]()
        
        for trip in trips {
            if trip.login == login {
                userTrips.append(trip)
            }
        }
        
        return userTrips
        
    }
    
    func newTrip(_ departLocationText:String , _ arrivalLocationText:String, _ departureDateText:String, _ returnDateText:String, _ numTravelersText:String, _ travelerNationalityText:String, _ budgetText:String, _ ofAge:Bool, _ disabilities:Bool, _ purposeText:String, _ statusText:String) -> Bool {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Trip", in: managedContext)!
        
        //similar to insert in sql language
        let trip = Trip(entity: entity, insertInto: managedContext)
        trip.departLocation = departLocationText
        trip.arrivalLocation = arrivalLocationText
        trip.departureDate = departureDateText
        trip.returnDate = returnDateText
        trip.numTravelers = numTravelersText
        trip.travelerNationality = travelerNationalityText
        trip.budget = budgetText
        trip.ofAge = ofAge
        trip.disabilities = disabilities
        trip.purpose = purposeText
        trip.status = statusText
        trip.login = AccountDataSource.whoAmI
        
        do {
            try managedContext.save()
            trips.append(trip)
            save()
            return true
        }
        catch let error as NSError {
            print("Failed to save Entree.  \(error), \(error.userInfo)")
            return false
        }
    }
    
//    func deleteEntree(entree: Entree) {
//        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
//            print("Failed to save.")
//            return
//        }
//        
//        if let index = entrees.index(of: entree) {
//            
//            let managedContext = delegate.persistentContainer.viewContext
//            
//            managedContext.delete(entree)
//            
//            entrees.remove(at: index)
//        }
//        
//        save()
//    }
    
    func save() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Failed to save.")
            return
        }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Failed to save. \(error), \(error.userInfo)")
        }
    }
    
    
    func moveTrip(_ from:Int, _ to:Int) {
        let login = AccountDataSource.whoAmI
        
        //if from index not the same as to index
        
        var userTrips = [Trip]()
        
        for trip in trips {
            if trip.login == login {
                print(trip.arrivalLocation!)
                userTrips.append(trip)
            }
        }
        
        if from != to {
            let trip = userTrips[from]
            userTrips.remove(at: from)
            userTrips.insert(trip, at: to)
        }
    }
}
