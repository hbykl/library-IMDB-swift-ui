//
//  ViewController.swift
//  HMBOOK
//
//  Created by Hüsna Bıyıklı on 13.05.2024.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftUI

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }

    
    @IBAction func loginButton(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: mailField.text!,password: passwordField.text!){user,error in
            if (error==nil){
                
                debugPrint("giriş başarılı")
                self.performSegue(withIdentifier: "HomeSeque", sender: self)
            }
            else {
                debugPrint("giriş başarısız")
                debugPrint(error?.localizedDescription as Any)
            }
                
        }
    }
    
    @IBAction func registeButton(_ sender: UIButton) {
      performSegue(withIdentifier: "showRegister", sender: self)
        
    }
}

