//
//  ViewController.swift
//  Piano
//
//  Created by Raúl  on 03/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    let soundsArray:[String] = ["c1","c1s","d1","d1s","e1","f1","f1s","g1","g1s","a1","a1s","b1","c2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playSound(_ sender: UIButton) {
        let tagKey = sender.tag
        let fileName = soundsArray[tagKey-1]
        print("Pulsado  \(fileName)")
        
        if let soundURL:URL = Bundle.main.url(forResource: fileName, withExtension: ".mp3"){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.play()
            }
            catch{
                print(error)
            }
        }
    }
    
}

