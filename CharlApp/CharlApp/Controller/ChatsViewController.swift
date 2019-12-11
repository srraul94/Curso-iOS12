//
//  ChatsViewController.swift
//  CharlApp
//
//  Created by Raúl  on 10/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import Firebase

class ChatsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
  
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textBoxHeight: NSLayoutConstraint!
    
    let array:[Message] = [ Message(sender: "Paco", msg: "Hola amigo! que tal estas") ,Message(sender: "Juan", msg: "Hola amigo! que tal colega") ,Message(sender: "Jose", msg: "Hola amigo! que tal hdp")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(messageTableViewTapped))
        self.messageTableView.addGestureRecognizer(tapGesture)
        
        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self
        self.messageTextField.delegate = self
       
        //Registro la celda creada con XIB para usarla de prototipo.
        self.messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCellID")
        
       self.messageTableView.rowHeight = UITableView.automaticDimension
       self.messageTableView.estimatedRowHeight = 120
    }
    
    @IBAction func exitButtonPressed(_ sender: UIBarButtonItem) {
        
        do{
         try Auth.auth().signOut()
        }
        catch{
            print("Error al cerrar sesión.")
        }
        
        guard navigationController?.popToRootViewController(animated: true) != nil else {
            print("No hay viewcontrollers que eliminar de la stack")
            return
        }
        
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        //Se deshabilitan para que no se dupliquen mensajes si damos varias veces a enviar
        messageTextField.isEnabled = false
        sendButton.isEnabled = false
        
        let messageDB = Database.database().reference().child("Messages")
        let messageDict = ["sender":Auth.auth().currentUser?.email,
                           "msg": self.messageTextField.text]
        messageDB.childByAutoId().setValue(messageDict) { (error, ref) in
            if error != nil {
                print(error!)
            }
            else{
                print("Guardado correctamente!")
                self.messageTextField.isEnabled = true
                self.sendButton.isEnabled = true
                
                //para que aparezca en blanco despues de enviar
                self.messageTextField.text = ""
            }
        }
    }
    
    
   

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCellID", for: indexPath) as! MessageCell
        
        cell.usernameLabel.text = self.array[indexPath.row].sender
        cell.messageLabel.text = self.array[indexPath.row].message
        return cell
    }
    
    //MARK: - IUText delegate metodos.
      

    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.textBoxHeight.constant = 100 + 308
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        messageTableViewTapped()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.endEditing(true)
         return true
    }
    
    
    @objc func messageTableViewTapped(){
        self.messageTextField.resignFirstResponder()
        UIView.animate(withDuration: 0.1) {
            self.textBoxHeight.constant = 100
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
