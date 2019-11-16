//
//  GPAcalculaterViewController.swift
//  evneet_759831_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class GPAcalculaterViewController: UIViewController {
    
    
    @IBOutlet var courceLabel: [UILabel]!
    @IBOutlet var textfeild: [UITextField]!
    @IBOutlet var result: UILabel!
    
    var audioplayer: AVAudioPlayer!
    var c1: Double?
    var marks: Double?
    var gpa = 0.0
   
    var semesterDelegate: semesterTableViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in courceLabel.indices{
            courceLabel[i].text = Courses.courseList[(semesterDelegate?.semesterIndx)!][i]

        }
        
        // Do any additional setup after loading the view.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func calculate(_ sender: UIButton) {
        
        for i in textfeild.indices{
            
            marks = convertToGPA(marks: Int(textfeild[i].text!)!)
            Student.studentData[semesterDelegate!.stdSemIndx].marks[semesterDelegate!.semesterIndx][i] = Int(textfeild[i].text!)!
            let credit = courceLabel[i].text!
            gpa += (marks! * Double(String(credit[credit.index(before: credit.endIndex)]))!)
            

            
            
        }
        let semesterGpa = gpa / 20.0
        Student.studentData[semesterDelegate!.stdSemIndx].gpa[semesterDelegate!.semesterIndx] = semesterGpa
        
        result.text = String(format: "GPA: %.2f /4 ", semesterGpa)
      
         


         if semesterGpa > 2.8{

             let soundURL = Bundle.main.url(forResource: "Win", withExtension: "wav")
             audioplayer = try! AVAudioPlayer(contentsOf: soundURL!)
             audioplayer.play()
         }
        print("\(Student.studentData)")
        
        
        
    }
    
    
    func convertToGPA(marks : Int) -> Double{
        switch marks {
        case 0...49:
            c1 = 0.0
        case 50...59:
            c1 = 1.0
        case 60...62:
            c1 = 1.7
        case 63...66:
            c1 = 2.0
        case 67...69:
            c1 = 2.3
        case 70...72:
            c1 = 2.7
        case 73...76:
            c1 = 3.0
        case 77...79:
            c1 = 3.2
        case 80...86:
            c1 = 3.5
        case 87...93:
            c1 = 3.7
        case 94...100:
            c1 = 4.0
        default:
            break
        }
        
        return c1!
    }
    
}
