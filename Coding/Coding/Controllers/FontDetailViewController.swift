//
//  FontDetailViewController.swift
//  Coding
//
//  Created by Raúl  on 03/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
   
    

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var pickerFont: UIPickerView!
    @IBOutlet weak var textViewFonts: UITextView!
    
    var familyName:String = ""
    var fonts:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelTitle.text = familyName
        self.labelTitle.font = UIFont(name: familyName, size: 22.0)
        // Do any additional setup after loading the view.
        
        if(fonts.count == 0){
            self.pickerFont.isHidden = true
        }
        
        self.textViewFonts.font = UIFont(name: self.familyName, size: 18.0)
        //hace lo mismo que si lo hacemos desde el Storyboard.
        //self.pickerFont.dataSource = self
        //self.pickerFont.delegate = self
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    
    // MARK: - UIPickerView methods.
    //Numero de columnas de la pickerview. Por ejemplo el de fechas tendría 3 columnas. (nos sirve con una)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
       
    //Numero de filas por columnas es el numero de fuentes que tenga una familia en nuestro caso.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
    }
    
    //Nombre de la fila dado su columna (componente) y su numero de fila.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.fonts[row]
    }
    
    //Que hacer cuando se selecciona una fila concreta del pickerView.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = self.fonts[row]
        self.textViewFonts.font = UIFont(name: font, size: 18.0)
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
