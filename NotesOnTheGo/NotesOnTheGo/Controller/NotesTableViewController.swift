//
//  NotesTableViewController.swift
//  NotesOnTheGo
//
//  Created by Raúl  on 11/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UITableViewController{
    
    
    var notesArray = [Note]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedCategory : Category?{
        didSet{
               loadNotes()
        }
    }
    
   // let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Notes.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = selectedCategory?.title
        self.navigationItem.hidesSearchBarWhenScrolling = true
        
        loadNotes()
        
        
       /* if let previousNotes = defaults.array(forKey: "NotesArray")  as? [Note] {
            self.notesArray = previousNotes
        }*/
        
      /*  let firstNote = Note()
        firstNote.checked = true
        firstNote.title = "Primera nota"
        
        let secondNote = Note()
        secondNote.checked = false
        secondNote.title = "Segunda nota"
        
        let thirdNote = Note()
        thirdNote.checked = true
        thirdNote.title = "Tercera nota"
        
        notesArray.append(firstNote)
        notesArray.append(secondNote)
        notesArray.append(thirdNote)*/
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.leftBarButtonItem?.tintColor = UIColor()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = notesArray[indexPath.row]
        cell.textLabel?.text = note.title
        
        if note.checked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }

        return cell
    }
    
    //MARK: - Añadir nuevos items a la tabla.
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField:UITextField = UITextField()
        
        let alerta = UIAlertController(title: "Añadir nueva nota", message: "", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Añadir", style: .default) { (action) in
            
            let note = Note(context: self.context)
            note.title = textField.text!
            
            self.notesArray.append(note)
            self.persistNotes()
           
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(addAction)
        alerta.addAction(cancelAction)
        
        alerta.addTextField { (alertTextField) in
            alertTextField.placeholder = "Titulo de la nota..."
            textField = alertTextField
        }
        present(alerta, animated: true, completion: nil)
    }
    
    //MARK: - Métodos de Table View Delegate
       
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           let note = self.notesArray[indexPath.row]
           note.checked =  (note.checked ? false : true)
         
        
            //MARK: Borrado core data.
           //context.delete(notesArray[indexPath.row])
           //notesArray.remove(at: indexPath.row)
           
        
           persistNotes()
           
           
           //Desactiva la seleción en gris
           tableView.deselectRow(at: indexPath, animated: true)
       }
    
    
    //MARK: - Data persistant and manipulation
    
    func persistNotes (){
       /* let encoder  = PropertyListEncoder()
        do{
           let data = try encoder.encode(self.notesArray)
           try data.write(to:self.dataFilePath!)
        }
        catch{
            print("Error al codificar el array de notas.")
        }*/
        
        do{
            try context.save()
        }
        catch{
            print(error)
        }
                   
        //self.defaults.set(self.notesArray,forKey: "NotesArray")
        //Recarga el contenido de la tabla.
        self.tableView.reloadData()
    }
    
    func loadNotes (fromRequest: NSFetchRequest<Note> = Note.fetchRequest()){
        /*if let data = try? Data(contentsOf: self.dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
                self.notesArray = try decoder.decode([Note].self, from: data)
            }
            catch{
                print("Error al descodificar el array de notas. ")
            }
        }*/
        
        //let request : NSFetchRequest<Note> = Note.fetchRequest()
        do {
            notesArray =  try context.fetch(fromRequest)
        } catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
    func deleteNotes(){
        
    }
    
    
   
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   

}

//MARK: SearchBar methods
extension NotesTableViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!
        let request:NSFetchRequest<Note> = Note.fetchRequest()
        
        //Campo donde queremos buscar, contenga, y %@ cualquier contenido que venga a continuación.
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        request.predicate = predicate
        
        let sortDescription:NSSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescription]
        
        loadNotes(fromRequest: request)
        
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadNotes()
            DispatchQueue.main.async {
                 searchBar.resignFirstResponder() 
            }
            
        }
        
    }
}
