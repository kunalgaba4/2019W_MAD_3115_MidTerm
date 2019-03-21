//
//  Student.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
class student{
    var studentId: String?
    var studentName: String?
    var gender: String?
    var course: String?
    var date: Date?
    var marks:[Float]?
    
    init(studentId: String, studentName: String ,gender: String, course: String,date: Date, marks: [Float]) {
        self.studentId = studentId
        self.studentName = studentName
        self.gender = gender
        self.course = course
        self.date = date
        self.marks = marks
    }
}

