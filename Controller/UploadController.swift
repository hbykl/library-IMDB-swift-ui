//
//  UploadController.swift
//  HMBOOK
//
//  Created by Hüsna Bıyıklı on 14.05.2024.
//

import UIKit
import FirebaseStorage
import FirebaseFirestoreInternal
import FirebaseAuth

class UploadController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var bookNameTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        myImage.addGestureRecognizer(recognizer)
    }
    
    @objc func pickImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        myImage.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createBook(_ sender: UIButton) {
        print("butoon tıklandı upload")
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let mediaFolder = storageReferance.child("Images")
        let uuid = UUID().uuidString
        let myData = myImage.image?.jpegData(compressionQuality: 0.5)
        let imageReferance = mediaFolder.child("\(uuid).jpeg")
        print("yüklendi")
        
        let uploadTask = imageReferance.putData(myData!, metadata: nil) { metadata, error in
            if let error = error  {
                print(error.localizedDescription as Any)
            }
            else{
                imageReferance.downloadURL { url, error in
                    
                    if(error == nil){
                        let imageURL = url?.absoluteString
                        print(imageURL!)
                        if let imageURL = imageURL{
                            let fireStore = Firestore.firestore()
                            let fireSCol = ["Kitapİsmi" : self.bookNameTF.text! , "Kullanıcı" : Auth.auth().currentUser!.email , "imageURL" : imageURL]
                            fireStore.collection("Book").addDocument(data: fireSCol) { (error) in
                                
                                if error != nil{
                                    print(error?.localizedDescription as Any)
                                }
                                else{
                                    self.performSegue(withIdentifier: "uploadHome", sender: self)
                                }
                            }
                            
                        }

                        
                        
                    }
                }
            }
            
        }
        
    }
    
    
    
    
    
    
}
