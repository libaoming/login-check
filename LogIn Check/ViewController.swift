//
//  ViewController.swift
//  LogIn Check
//
//  Created by 李宝明 on 16/8/25.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var userTip: UILabel!


    @IBAction func onLoginBtnTapped(_ sender: AnyObject) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

       
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        
        newUser.setValue(textFeild.text, forKey: "username")
        
        do {
            
            try context.save()
            
            textFeild.alpha = 0
            logInButton.alpha = 0
            
            userTip.text = "hi, \(textFeild.text!)"
            
            
        }catch {
            
        }
        
    }
    @IBOutlet weak var textFeild: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
           let results = try  context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if  let username = result.value(forKey: "username") as? String {
                        
                        textFeild.text = username
                        
                        logInButton.alpha = 0
                        textFeild.alpha = 0
                        userTip.text = "hi , \(username)"
                    }
                    
                    
                    
                    
                    
                }
            }
            
            
        } catch {
            
            
        }
        
        

    }

    

}

