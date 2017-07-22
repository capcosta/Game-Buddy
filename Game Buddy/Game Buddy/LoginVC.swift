//
//  LoginVC.swift
//  Game Buddy
//
//  Created by Carlos on 2017-07-21.
//  Copyright © 2017 Carlos da Costa. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    override func viewDidLoad() {
			super.viewDidLoad()
			view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
		}

	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	
	@IBAction func handleRegister(_ sender: UIButton) {
		guard nameField.text != "", emailField.text != "", passwordField.text != "" else {
			print("invalid credentials")
			return
		}
		print("email: \(emailField.text!)")
		print("password: \(passwordField.text!)")
		
		Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
			if error != nil {	print(error as Any); return }
			guard let uid = user?.uid else { return }
			let usersReference = ref.child("users").child(uid)
			let values = ["name":self.nameField.text!,"email":self.emailField.text!]
			usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
				if err != nil {	print(err as Any); return }
				
				print("saved user successfully into Firebase db")
			})
		})
	}

	override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
	
  }
