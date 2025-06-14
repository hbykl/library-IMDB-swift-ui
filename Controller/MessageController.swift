//
//  MessageController.swift
//  HMBOOK
//
//  Created by Hüsna Bıyıklı on 18.05.2024.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import FirebaseDatabaseInternal

class MessageController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var uid = [String]()
    var users = [String]()
    var messages = [String]()
    var times = [String]()
    var myDB = Database.database().reference()


    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var Header: UILabel!
    
    @IBOutlet weak var messageTF: UITextField!
    
    var receivedBookName:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        if let receivedBookName = receivedBookName {
            Header.text = receivedBookName
            
        }
        TableView.dataSource = self
        TableView.delegate = self
        getMessage()
        // Do any additional setup after loading the view.
    }
    
    func getMessage(){
        let DB = Database.database().reference().child(receivedBookName!)
        DB.observe(.value) {(snapshot) in
            if let value = snapshot.value as? [String: Any] {
                print(value.keys)
                       self.messages.removeAll()
                       self.times.removeAll()
                       self.users.removeAll()
                       self.uid.removeAll()

                for (key, data) in value {
                    if let dataDict = data as? [String: Any] {
                        let Times = dataDict["times"] as? String ?? ""
                        let Messages = dataDict["messages"] as? String ?? ""
                        let Users = dataDict["users"] as? String ?? ""
                        print(Messages)
                        print(Times)
                        print(Users)
                        if (self.uid.contains(key) == false){
                            self.messages.append(Messages)
                            self.times.append(Times)
                            self.users.append(Users)
                            self.uid.append(key)
                        }
                    }
                }
                
                let sortedIndices = self.times.indices.sorted(by: { self.times[$0] < self.times[$1] })
                       self.messages = sortedIndices.map { self.messages[$0] }
                       self.times = sortedIndices.map { self.times[$0] }
                       self.users = sortedIndices.map { self.users[$0] }
                       self.uid = sortedIndices.map { self.uid[$0] }
                print(self.messages.count,"getmsg")
                print(self.messages)
                print(self.times)
                print(self.users)
                self.TableView.reloadData()
            }}}

    
    
    @IBAction func homePage(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowBookPage", sender: self)
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
        let uuid = UUID().uuidString
        let myDBTable = myDB.child(receivedBookName!).child(uuid)
        let Messages = myDBTable.child("messages")
        let Users = myDBTable.child("users")
        let Times = myDBTable.child("times")
        let MessageData = messageTF.text
        let UserData = Auth.auth().currentUser?.email
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        let time = dateString
        Messages.setValue(MessageData)
        Users.setValue(UserData)
        Times.setValue(time)
        messageTF.text = ""
        print(messages.count,"sendmsg")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if(users[indexPath.row] == Auth.auth().currentUser?.email){
            let cell = TableView.dequeueReusableCell(withIdentifier: "rightMessage", for: indexPath) as! RightCell
            cell.rightMessage.text = messages[indexPath.row]
            cell.nameSpace.text = users[indexPath.row]
            return cell
        }
        else{
            let cell = TableView.dequeueReusableCell(withIdentifier: "leftMessage", for: indexPath) as! LeftCell
            cell.leftMessage.text = messages[indexPath.row]
            cell.nameSpace.text = users[indexPath.row]
            return cell
        }

    }
    
    
    

}
