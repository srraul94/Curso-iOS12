//
//  NewCategoryViewController.swift
//  NotesOnTheGo
//
//  Created by Raúl  on 13/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {

    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet var colorSliders: [UISlider]!
    
    
    @IBOutlet var colorLabels: [UILabel]!
    
    let imagePicker = UIImagePickerController()
    
    
    let colorsKey =  ["R: ","G: ","B: ","A: "]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var colorHex = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Añadimos un tapgesture para que pueda reconocer cuando se hace click en la imagen.
        let tapGesture =  UITapGestureRecognizer(target: self , action: #selector(imageViewTapped))
        categoryImageView.isUserInteractionEnabled = true
        categoryImageView.addGestureRecognizer(tapGesture)
        
        repaingBackground()
        self.imagePicker.delegate = self
       
    }
    
    
    
    
    //MARK: - Interface Methods

    @IBAction func sliderMoved(_ sender: UISlider) {
        colorLabels[sender.tag].text = "\(colorsKey[sender.tag])\(lroundf(sender.value*255.0))"
        repaingBackground()
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let category = Category(context: context)
        category.title = categoryTextField.text
        category.colorHex = UIColor(hex: self.colorHex)?.toHex
        category.image = categoryImageView.image?.jpegData(compressionQuality: 0.6)
        
        do{
            try context.save()
        }
        catch{
            print(error)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func imageViewTapped(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    

}

//MARK: - UITexfield Delegate Methods

extension NewCategoryViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func repaingBackground (){
        let backColor = UIColor(red: CGFloat(colorSliders[0].value), green:  CGFloat(colorSliders[1].value), blue:  CGFloat(colorSliders[2].value), alpha:  CGFloat(colorSliders[3].value))
        self.view.backgroundColor = backColor
        self.colorHex = backColor.toHex!
    }
}

//MARK: - UIImagePicker Delegate Methods

extension NewCategoryViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            categoryImageView.contentMode = .scaleAspectFit
            categoryImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil )
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
