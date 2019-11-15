//
//  ViewController.swift
//  evneet_759831_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstname: UITextField!
    @IBOutlet var lastname: UITextField!
    @IBOutlet var stId: UITextField!
    var studentdelegate: StudentTableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        
        let alertcontroller = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "No Way", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "Yes, I'm sure!", style: .default) { (action) in
           
            
            let firstName = self.firstname.text
            let lastName = self.lastname.text
            let studentId = self.stId.text
            
            let s = Student(firstName: firstName!, lastName: lastName!, sId: studentId!)
            
            Student.studentData.append(s)
            print("\(Student.studentData)")
            
            let alert = UIAlertController(title: "New contact saved", message: "\(firstName!) is now a student", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel) { (action) in
                self.firstname.text = ""
                self.lastname.text = ""
                self.stId.text = ""
            }
            
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        
        alertcontroller.addAction(cancel)
        alertcontroller.addAction(ok)
        self.present(alertcontroller, animated: true, completion: nil)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        studentdelegate?.tableView.reloadData()
    }
    

}

