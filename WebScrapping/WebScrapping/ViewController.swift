//
//  ViewController.swift
//  WebScrapping
//
//  Created by Raúl  on 04/12/2019.
//  Copyright © 2019 Raúl . All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class ViewController: UIViewController {

    let url = "https://www.elportaldemusica.es/lists/top-100-canciones/2019/1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        ScrapeURL()
    }
    
    func ScrapeURL(){
        Alamofire.request(url).responseString { (response) in
            if response.result.isSuccess{
                if let htmlString = response.result.value{
                    self.parseHTML(html: htmlString)
                }
            }
            
        }
    }
    
    func parseHTML(html:String){
        print(html)
        
        do{
            let doc = try Kanna.HTML(html: html, encoding: .utf8)
            print(doc.title)
            print(doc.body)
            
        }
        catch{
            print(error)
        }
    }
    
    
    
    

    
    


}

