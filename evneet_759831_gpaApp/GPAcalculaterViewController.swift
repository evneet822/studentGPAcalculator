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
    
    
    
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var lbl3: UILabel!
    @IBOutlet var lbl4: UILabel!
    @IBOutlet var lbl5: UILabel!
    
    @IBOutlet var textfeild1: UITextField!
    @IBOutlet var textfeild2: UITextField!
    @IBOutlet var textfeild3: UITextField!
    @IBOutlet var textfeild4: UITextField!
    @IBOutlet var textfeild5: UITextField!
    @IBOutlet var result: UILabel!
    
    var audioplayer: AVAudioPlayer!
    let sound = ["Win"]
    var c1: Double?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let course1 = convertToGPA(marks: Int(textfeild1.text!)!)
         let course2 = convertToGPA(marks: Int(textfeild2.text!)!)
         let course3 = convertToGPA(marks: Int(textfeild3.text!)!)
         let course4 = convertToGPA(marks: Int(textfeild4.text!)!)
         let course5 = convertToGPA(marks: Int(textfeild5.text!)!)
         
         let gpa = ((course1 * 4) + (course2 * 3) + (course3 * 3) + (course4 * 5) +  (course5 * 5)) / 20.0
         result.text = "GPA: \(gpa)/4"
        
         
         if gpa > 2.8{
             let selectedButton = sound[sender.tag]
             let soundURL = Bundle.main.url(forResource: selectedButton, withExtension: "wav")
             audioplayer = try! AVAudioPlayer(contentsOf: soundURL!)
             audioplayer.play()
         }
        
        
        
        
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
