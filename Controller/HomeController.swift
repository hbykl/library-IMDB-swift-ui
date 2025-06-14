//
//  HomeController.swift
//  HMBOOK
//
//  Created by Hüsna Bıyıklı on 13.05.2024.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import SDWebImage

class HomeController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    
    var userNames = [String]()
    var bookNames = [String]()
    var images = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        TableView.delegate = self
        TableView.dataSource=self
        fireBaseGetCells()
        
    }
    
    func fireBaseGetCells(){
        let FS = Firestore.firestore().collection("Book").order(by: "Kitapİsmi")
        FS.addSnapshotListener { snapshot, error in
            if (error != nil){
                print(error?.localizedDescription as Any)
            }
            else {
                if (snapshot?.isEmpty != true && snapshot != nil){
                    for document in snapshot!.documents {
                        if let görselUrl = document.get("imageURL") as? String{
                            self.images.append(görselUrl)
                        }
                        if let bookName = document.get("Kitapİsmi") as? String {
                            self.bookNames.append(bookName)
                        }
                        if let userName = document.get("Kullanıcı") as? String{
                            self.userNames.append(userName)
                        }
                    }
                    self.TableView.reloadData()
                    
                }
            }
            //1,10,11,12,13....,2,20,21,22.....,3,30,31,32.....,4
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        cell.bookName.text = bookNames[indexPath.row]
        cell.userName.text = userNames[indexPath.row]
        cell.myImage.sd_setImage(with: URL(string: self.images[indexPath.row]))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showMessage", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMessage" {
            if let indexPath = sender as? IndexPath {
                let bookName = bookNames[indexPath.row]
                let destinationVC = segue.destination as? MessageController
                destinationVC?.receivedBookName = bookName
            }}}
            
            
            @IBAction func createBook(_ sender: UIButton) {
                print("ekle button tıklandı")
                self.performSegue(withIdentifier: "PlusSeque", sender: self)
            }
            
            
            @IBAction func signOut(_ sender: UIButton) {
                print("button tıklandı")
                do{
                    try Auth.auth().signOut()
                    self.performSegue(withIdentifier: "showSignIn", sender: self)
                    
                }
                catch{
                    print("Hata")
                }
                
            }
            
            
            
        }
        
    
