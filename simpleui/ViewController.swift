//
//  ViewController.swift
//  SimpleUI
//
//  Created by Nils Fischer on 06.03.15.
//  Copyright (c) 2015 Nils Fischer. All rights reserved.
//

import UIKit
import Darwin


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 254 / 255.0, green: 249 / 255.0, blue: 55 / 255.0, alpha: 1 / 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    var anfangstemp:Double = 4
    var kochzeit:Double = 6
    var höhe:Double = 300
    var gewicht:Double = 50
    var konsistenz:Double = 65
    var luftdruck:Double = 0
    var siedetemp:Double = 0
    
    func updateKochzeitLabel() {
        luftdruck = (1013.25*exp(-höhe/8000))
        siedetemp = (234.175*log(luftdruck/6.1078)/(17.08085 - log(luftdruck/6.1078)))
        kochzeit = (round((0.465*(pow(gewicht,(2/3)))*log(0.76*(siedetemp-anfangstemp)/(siedetemp - konsistenz)))*10))/10
        kochzeittext.text = "\(kochzeit) Minuten"
    }
    
    
    @IBOutlet var höhetext: UILabel!
    @IBOutlet var höheslider: UISlider!
    @IBAction func höhechange(sender: AnyObject) {
        höhe = Double(höheslider.value)
        höhetext.text = "\(Int(höhe))"
        
        updateKochzeitLabel()
    }
    
    
    @IBOutlet var gewichttext: UILabel!
    @IBOutlet var gewichtslider: UISlider!
    @IBAction func gewichtchange(sender: AnyObject) {
        gewicht = Double(gewichtslider.value)
        gewichttext.text = "\(Int(gewicht))"
        
        updateKochzeitLabel()
    }
    
    
    @IBOutlet var konstext: UILabel!
    @IBOutlet var gradtext: UILabel!
    @IBOutlet var konsslider: UISlider!
    @IBAction func konschange(sender: AnyObject) {
        konsistenz = Double(konsslider.value)
        gradtext.text = "(\(Int(konsistenz))°C)"
        if konsistenz < 62 {
            konstext.text = "flüssig"
        } else if konsistenz < 75 {
            konstext.text = "weich"
        } else {
            konstext.text = "hart"
        }
        
        updateKochzeitLabel()
    }
   
    
    @IBOutlet var switchstate: UISwitch!
    @IBAction func kühlchange(sender: AnyObject) {
        if switchstate.on {
            anfangstemp = 4
        } else {
            anfangstemp = 20
        }
        
        updateKochzeitLabel()
    }
    
    
    @IBOutlet var kochzeittext: UILabel!

    
}

