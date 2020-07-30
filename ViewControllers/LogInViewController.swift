//
//  LogInViewController.swift
//  Shift_Share
//
//  Created by user167528 on 7/20/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit
import FirebaseAuth
class LogInViewController: UIViewController {
    
 
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
             setUpElements()
         }
         
         func setUpElements() {
             
             // Hide the error label
             errorLabel.alpha = 0
             
             // Style the elements
             Utilities.styleTextField(emailTextField)
             Utilities.styleTextField(passwordTextField)
             Utilities.styleFilledButton(logInButton)
             
         }
 
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        // TODO: Validate Text Fields
             let error = validateFields()
                          
                          if error != nil {
                              
                              // There's something wrong with the fields, show error message
                            showError(error!)
                          }
             // Create cleaned versions of the text field
             let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             
             // Signing in the user
             Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                 
                 if error != nil {
                     // Couldn't sign in
                     self.errorLabel.text = error!.localizedDescription
                     self.errorLabel.alpha = 1
                    print("Daniel the king 12345647")
                 }
                 else {
                     
//                     let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//                     self.view.window?.rootViewController = homeViewController
//                     self.view.window?.makeKeyAndVisible()
                    self.performSegue(withIdentifier: "logInHome", sender: self)
                    
                 }
                
             }
     
        
    }
    func showError(_ message:String) {
                     
                     errorLabel.text = message
                     errorLabel.alpha = 1
                 }
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier=="logInHome"{
        _ = segue.destination as! HomeViewController
        }
    
}
}
