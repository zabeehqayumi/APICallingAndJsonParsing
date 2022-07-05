//
//  ViewController.swift
//  APICallingAndJsonParsing
//
//  Created by Zab on 11/4/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveData(name: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        //1
        let managedContext = appDelegate.persistentContainer.viewContext
        //2
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        //3
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        //4
        person.setValue(name, forKey: "name")
        //5
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    func fetchFromCoreData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
           people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("could not retrieve \(error)")
        }
    }
}

