//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Cole Schnetzler on 7/6/15.
//  Copyright © 2015 Cole Schnetzler. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var collegeTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var websiteTextField: UITextField!
    
    var college : College!
    
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        imageView.image = college.image
        websiteTextField.text = String(college.webURL!)
        collegeTextField.delegate = self
        locationTextField.delegate = self
        enrollmentTextField.delegate = self
        websiteTextField.delegate = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
        college.webURL = NSURL(string: websiteTextField.text!)!
        college.image = imageView.image
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        collegeTextField.endEditing(true)
        locationTextField.endEditing(true)
        enrollmentTextField.endEditing(true)
        websiteTextField.endEditing(true)
        return true
    }
    
    @IBAction func onWebsiteButtonTapped(sender: UIButton) {
        UIApplication.sharedApplication().openURL(college.webURL!)
    }
    
    
    @IBAction func onCameraButtonTapped(sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imagePicker.sourceType = .Camera
        }
        else {
            imagePicker.sourceType = .PhotoLibrary
        }
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true) { () -> Void in
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.imageView.image = image
            }
        }
    }
}






