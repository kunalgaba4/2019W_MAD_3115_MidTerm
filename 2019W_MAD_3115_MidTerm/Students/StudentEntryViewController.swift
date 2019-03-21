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
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coursePickerView.isHidden = true
        self.coursePickerView.delegate = self
        self.coursePickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAResult(_ sender: UIButton) {
        let studentId = studentIdTextField.text
        let studentName = studentNameTextField.text
        let gender = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)
        let email = emailTextField.text
        if studentId!.isEmpty || studentId!.contains(""){
            return
        }
        
    }
    
    
    @IBAction func dobTextField(_ sender: UITextField) {
        showDatePicker()
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dobTextField.inputAccessoryView = toolbar
        dobTextField.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dobTextField.text = formatter.string(from: datePicker.date)
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
