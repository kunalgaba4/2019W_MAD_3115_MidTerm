//
//  StudentResultViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentResultViewController: UIViewController {
    
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var totalMarks: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    var student: Student?
    var totalMarks1 : Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculateTotalMarks()
        updateDetails()
    }
    
    func updateDetails(){
        totalMarks.text = "\(totalMarks1)"
        name.text = student?.studentName
    }
    
    func calculateTotalMarks(){
        var marks = student?.marks
        for m in marks!{
            totalMarks1 = totalMarks1 + m
        }
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
