//
//  studentStruct.swift
//  evneet_759831_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
struct Student {
    var firstName: String
    var lastName: String
    var sId: String
    var marks = [["","","","",""],["","","","",""],["","","","",""]]
    var gpa = [0.0,0.0,0.0]
    var cgpa: Double{
        
        return (gpa[0] + gpa[1] + gpa[2]) / 3
    }
    
    static var studentData = [Student]()
    
}
