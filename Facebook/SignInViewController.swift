//
//  LoginViewController.swift
//  week2exercise
//
//  Created by Hearsay Guest on 10/14/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var formBackground: UIImageView!
    
    var logoViewCenterY: CGFloat!
    var emailFieldCenterY: CGFloat!
    var passwordFieldCenterY: CGFloat!
    var loginButtonCenterY: CGFloat!
    var formBackgroundCenterY: CGFloat!
    var activityViewCenterY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.enabled = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:
            UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        logoViewCenterY = logoView.center.y
        emailFieldCenterY = emailField.center.y
        passwordFieldCenterY = passwordField.center.y
        loginButtonCenterY = loginButton.center.y
        formBackgroundCenterY = formBackground.center.y
        activityViewCenterY = activityView.center.y
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(sender: AnyObject) {
        loginButton.selected = true
        activityView.startAnimating()
        delay(2, closure: { () -> () in self.activityView.stopAnimating()
            self.loginButton.selected = false
            
            if self.emailField.text == "john" && self.passwordField.text == "pw" {self.performSegueWithIdentifier("app_segue", sender: self)
            }
        })
        
    }
    
    @IBAction func onEmailChange(sender: AnyObject) {
        changeButtonState()
    }
    
    @IBAction func onPasswordChange(sender: AnyObject) {
        changeButtonState()
        
    }
    
    func changeButtonState() {
        if self.emailField.text.isEmpty || self.passwordField.text.isEmpty {
            loginButton.enabled = false
        }
        else {
            loginButton.enabled = true
        }
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
        self.logoView.center.y = self.logoViewCenterY - 10
        self.emailField.center.y = self.emailFieldCenterY - 10
        self.passwordField.center.y = self.passwordFieldCenterY - 10
        self.loginButton.center.y = self.loginButtonCenterY - 10
        self.formBackground.center.y = self.formBackgroundCenterY - 10
        self.activityView.center.y = self.activityViewCenterY - 10
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        self.logoView.center.y = self.logoViewCenterY + 10
        self.emailField.center.y = self.emailFieldCenterY + 10
        self.passwordField.center.y = self.passwordFieldCenterY + 10
        self.loginButton.center.y = self.loginButtonCenterY + 10
        self.formBackground.center.y = self.formBackgroundCenterY + 10
        self.activityView.center.y = self.activityViewCenterY + 10
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        println("ontap")
        view.endEditing(true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
