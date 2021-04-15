//
//  ViewController.swift
//  SimuladorTarjetas
//
//  Created by nickthewitcher on 4/15/21.
//

import UIKit
import Alamofire
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let apiService = ApiService.sharedInstance
         apiService.getSimulator()
            .subscribe(
                onNext: { print("onNext: \($0)") },
                onError: { print("onError: \($0)")
                   });
    }
    
    //test


}

