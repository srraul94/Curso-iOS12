//
//  Message.swift
//  CharlApp
//
//  Created by Raúl  on 10/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import Foundation

class Message {
    var sender:String = ""
    var message:String = ""
    
    init(sender:String, msg:String) {
        self.sender = sender
        self.message = msg
    }
}
