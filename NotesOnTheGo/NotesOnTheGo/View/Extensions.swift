//
//  Extensions.swift
//  NotesOnTheGo
//
//  Created by Raúl  on 13/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import Foundation


extension UIColor{
    //MARK: Inicialización.
    
    convenience init?(hex: String) {
        var hexNormalize = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexNormalize = hexNormalize.replacingOccurrences(of: "#", with: "")
        
        //Variables de RGBa
        var rgb:UInt64 = 0
        var r:CGFloat = 0.0
        var g:CGFloat = 0.0
        var b:CGFloat = 0.0
        var a:CGFloat = 0.0
        
        let length = hexNormalize.count
        
        Scanner(string: hexNormalize).scanHexInt64(&rgb)
        if length == 6 {
            //sin transparencia
            r = CGFloat((rgb & 0xFF0000)>>16) / 255.0
            g = CGFloat((rgb & 0x00FF00)>>8) / 255.0
            b = CGFloat((rgb & 0x0000FF)) / 255.0
        }else if length == 8 {
            r = CGFloat((rgb & 0xFF000000)>>24) / 255.0
            g = CGFloat((rgb & 0x00FF0000)>>16) / 255.0
            b = CGFloat((rgb & 0x0000FF00)>>8) / 255.0
            a = CGFloat((rgb & 0x000000FF)) / 255.0
        }
        else{
            return nil
        }
        self.init(red:r ,green:g ,blue:b ,alpha:a)
     
    }
    
    var toHex :String?  {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }
        //Variables RGBA
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4{
            a =  Float(components[3])
        }
        
        //Creamos el hexString
        let hex = String(format: "%02lX%02lX%02lX%02lX", lroundf(r*255),lroundf(g*255),lroundf(b*255),lroundf(a*255))
        
        return hex
    }
}


@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat{
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    
    @IBInspectable var cornerRadius : CGFloat{
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set{
            guard let uiColor = newValue else {return}
            layer.borderColor = uiColor.cgColor
        }
        get{
            guard let color = layer.borderColor else {return nil}
            return UIColor(cgColor: color)
        }
    }
    
}
