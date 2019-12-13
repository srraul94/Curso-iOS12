//
//  Category.swift
//  NotesOnTheGo
//
//  Created by Raúl  on 13/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import Foundation
import UIKit


extension Category {
    var color: UIColor?{
        get{
            guard let hex = colorHex else {return nil}
            return UIColor(hex: hex)
        }
        set(newColor){
            if let newColor = newColor{
                colorHex = newColor.toHex
            }
            
        }
    }
}
