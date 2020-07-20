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
             
             // Create cleaned versions of the text field
             let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             
             // Signing in the user
             Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                 
                 if error != nil {
                     // Couldn't sign in
                     self.errorLabel.text = error!.localizedDescription
                     self.errorLabel.alpha = 1
                 }
                 else {
                     
                     let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                     
                     self.view.window?.rootViewController = homeViewController
                     self.view.window?.makeKeyAndVisible()
                 }
             }
        
    }
    
}
