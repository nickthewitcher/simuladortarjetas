//
//  SecondController.swift
//  SimuladorTarjetas
//
//  Created by nickthewitcher on 4/16/21.
//

import Foundation
import Foundation
import UIKit

class SecondController: UIViewController {

    @IBOutlet weak var monedaLabel: UILabel!
    @IBOutlet weak var montoLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    
    var monedaText: String = ""
    var montoText: String = ""
    var fechaText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("mostrar 2da")
      
        monedaLabel.text = monedaText
        montoLabel.text = montoText
        fechaLabel.text = fechaText
        
        // Do any additional setup after loading the view.
    }


}
