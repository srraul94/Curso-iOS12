//
//  ViewController.swift
//  NotesOnTheGo
//
//  Created by Raúl  on 11/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import CoreData

class CategoriesViewController: UICollectionViewController {

    var CategoriesArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var selectedCategory = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.reloadData()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
         print("Entro el will appear")
         let request:NSFetchRequest<Category> = Category.fetchRequest()
         let sortDescription:NSSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
         request.sortDescriptors = [sortDescription]
               
         do{
           try CategoriesArray = context.fetch(request)
         }
         catch{
            print(error)
         }
        collectionView.reloadData()
    }
    
    //MARK: Métodos de Collection View Data Source

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoriesArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        let category = CategoriesArray[indexPath.row]
        cell.categoryLabel.text = category.title
        cell.categoryImageView.image = UIImage(data: category.image!)
        cell.categoryImageView.contentMode = .scaleAspectFit
        cell.categoryImageView.layer.borderColor = UIColor(hex: category.colorHex!)?.cgColor
        cell.categoryImageView.layer.borderWidth = 2
        cell.categoryImageView.layer.cornerRadius = 10
        cell.categoryImageView.backgroundColor = UIColor(hex: category.colorHex!)
        cell.categoryLabel.textColor = UIColor(hex: category.colorHex!)


        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = indexPath.row
        performSegue(withIdentifier: "ShowNoteList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ShowNoteList" {
               let destinationVC = segue.destination as! NotesTableViewController
               destinationVC.selectedCategory = CategoriesArray[selectedCategory]
           }
       }
    
    
    
        
}

