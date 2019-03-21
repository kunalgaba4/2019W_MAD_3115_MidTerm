//
//  StudentEntryViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var studentIdTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var studentNameTextField: UITextField!
    
    @IBOutlet weak var courseTextField: UITextField!
    
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var coursePickerView: UIPickerView!
    var courses = ["MADT","MODT","CSD","WADT"]
    var selectedCourse: String?
    var marks = [Float] ()
    @IBOutlet weak var sub5TextField: UITextField!
    @IBOutlet weak var sub4TextField: UITextField!
    @IBOutlet weak var sub3TextField: UITextField!
    @IBOutlet weak var sub2TextField: UITextField!
    @IBOutlet weak var sub1TextField: UITextField!
    let dateOfBirthPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coursePickerView.isHidden = true
        self.coursePickerView.delegate = self
        self.coursePickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        let userdefault = UserDefaults.standard
        if self.presentingViewController != nil {
            self.dismiss(animated: false, completion: {
                userdefault.removeObject(forKey: "userEmail")
                userdefault.removeObject(forKey: "pass")
                self.navigationController!.popToRootViewController(animated: true)
            })
        }
        else {
            userdefault.removeObject(forKey: "userEmail")
            userdefault.removeObject(forKey: "pass")
            self.navigationController!.popToRootViewController(animated: true)
        }
        
    }
    @IBAction func showAResult(_ sender: UIButton) {
        let studentId = studentIdTextField.text
        let studentName = studentNameTextField.text
        let email = emailTextField.text
        let gender = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)
        let sub1 = (Float)(sub1TextField.text!)
        let sub2 = (Float)(sub2TextField.text!)
        let sub3 = (Float)(sub3TextField.text!)
        let sub4 = (Float)(sub4TextField.text!)
        let sub5 = (Float)(sub5TextField.text!)
        
        marks.append(sub1!)
        marks.append(sub2!)
        marks.append(sub3!)
        marks.append(sub4!)
        marks.append(sub5!)

        if studentId!.isEmpty || studentId!.contains(""){
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "student") as! StudentResultViewController
        vc.student = Student(studentId: studentId!, studentName: studentName!, gender: gender!, course: selectedCourse!, date: dateOfBirthPicker.date, marks: marks)
        navigationController?.pushViewController(vc,animated: true)
    }
    
    
    @IBAction func dobTextField(_ sender: UITextField) {
        showDatePicker()
    }
    
    func showDatePicker(){
        //Formate Date
        dateOfBirthPicker.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let emptyButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,emptyButton,cancelButton], animated: false)
        dobTextField.inputAccessoryView = toolbar
        dobTextField.inputView = dateOfBirthPicker
        
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dobTextField.text = formatter.string(from: dateOfBirthPicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return courses.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return courses[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCourse = courses[row]
        courseTextField.text = courses[row]
        coursePickerView.isHidden = true
    }
    
    @IBAction func courseSelectionTextField(_ sender: UITextField) {
        coursePickerView.isHidden = false
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
