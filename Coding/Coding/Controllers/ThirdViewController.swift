//
//  ThirdViewController.swift
//  Coding
//
//  Created by Raúl  on 02/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var familyNames:[String] = []
    var fonts:[String:[String]] = [:]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.familyNames = UIFont.familyNames
        
       /* self.familyNames = self.familyNames.sorted { (s1, s2) -> Bool in
            return s1 > s2
        }*/
        self.familyNames = self.familyNames.sorted(by:{return $0 < $1})
        
        for fam in familyNames{
            self.fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
    }
    
    //MARK: Métodos del protocolo UITableView
    
    //Cuantas secciones tendremos en la table view.
    //Por ejemplo, tabla, prepara un sección, en esta caso en una sección.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas de cada sección.(que seran cada celda)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.familyNames.count
    }
    
    //Para recuperar una celda concreta con su id y su indexpath.
    //Ponemos el contenido de una celda concreta en base a la fila en la que esta.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        cell.textLabel?.text = familyNames[indexPath.row]
        cell.textLabel?.font = UIFont(name: familyNames[indexPath.row], size: 22.0)
        return cell
    }
    
     // MARK: - Metodos del protocolo UITableViewDelegate

    //Funcion para cuando seleccionamos una fila.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = self.familyNames[row]
        let familyFonts = self.fonts[fontFamily]!
    }
    

    
    // MARK: - Navigation

    // Prepara datos antes de la navegación.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowFontsForFamily"){
            let navController = segue.destination as! UINavigationController
            
            //obtengo el view en la cima del navigation controller.
            let destinationVC = navController.topViewController as! FontDetailViewController
            
            let idSelectedCell = tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = self.familyNames[idSelectedCell]
            destinationVC.fonts = self.fonts[self.familyNames[idSelectedCell]]!
        }
    }
    

}
