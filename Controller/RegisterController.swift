//
//  RegisterController.swift
//  HMBOOK
//
//  Created by Hüsna Bıyıklı on 13.05.2024.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController {

    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var passwordFile: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}
    
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: mailField.text!, password: passwordFile.text!){user,error in
            if(error==nil){
                debugPrint("Kayıt Başarılı")
            }
            else{
                debugPrint(error?.localizedDescription as Any)
                debugPrint("Kayıt Başarısız")
            }
        }
        self.performSegue(withIdentifier: "showMain", sender: self)
    }
    


}
