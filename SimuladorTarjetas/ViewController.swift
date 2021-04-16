//
//  ViewController.swift
//  SimuladorTarjetas
//
//  Created by nickthewitcher on 4/15/21.
//

import UIKit
import Alamofire
import RxSwift

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 

    @IBOutlet weak var cardPicker: UIPickerView!
    var cardPickerData: [String] = [String]()
    var cardOrdenElegido: Int = 0
    
    @IBOutlet weak var cuotasPicker: UIPickerView!
    var cuotasPickerData: [String] = [String]()
    var cuotasOrdenElegido: Int = 0
    
    
    @IBOutlet weak var tasasPicker: UIPickerView!
    var tasasPickerData: [String] = [String]()
    var tasasOrdenElegido: Int = 0
    
    @IBOutlet weak var pagosPicker: UIPickerView!
    var pagosPickerData: [String] = [String]()
    var pagosOrdenElegido: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        // Connect data:
        self.cardPicker.delegate = self
        self.cardPicker.dataSource = self
        
        self.cuotasPicker.delegate = self
        self.cuotasPicker.delegate = self
        
        self.tasasPicker.delegate = self
        self.tasasPicker.delegate = self
        
        self.pagosPicker.delegate = self
        self.pagosPicker.delegate = self
               
        
        let apiService = ApiService.sharedInstance
         apiService.getSimulator()
            .subscribe(
                onNext: {
                    print("onNext: \($0)")
                    self.cardPickerData = [($0).response.tarjetas.black, ($0).response.tarjetas.clasica, ($0).response.tarjetas.oro]
                    
                    self.cuotasPickerData = ($0).response.cuotas.map(String.init)
                    
                    self.tasasPickerData = ($0).response.tea
                    
                    self.pagosPickerData = ($0).response.diasPagos
                    
                    DispatchQueue.main.async {
                        self.cardPicker.reloadComponent(0)
                        self.cuotasPicker.reloadComponent(0)
                        self.tasasPicker.reloadComponent(0)
                        self.pagosPicker.reloadComponent(0)
                    }
                },
                onError: { print("onError: \($0)")
                   });
    }
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }

      // Number of columns of data
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      // The number of rows of data
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 0:
            return cardPickerData.count
        case 1:
            return cuotasPickerData.count
        case 2:
            return tasasPickerData.count
        case 3:
            return pagosPickerData.count
        default:
            return 0
        }
      }
      
      // The data to return fopr the row and component (column) that's being passed in
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
                case 0:
                    return cardPickerData[row]
                case 1:
                    return cuotasPickerData[row]
                case 2:
                    return tasasPickerData[row]
                case 3:
                    return pagosPickerData[row]
                default:
                    return ""
                }
      }
      
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
                case 0: print("card fila elegida ", row)
                    print("card componente elegido ",component)
                    self.cardOrdenElegido = row
                case 1:
                    print("cuotas fila elegida ", row)
                    print("cuotas componente elegido ",component)
                    self.cuotasOrdenElegido = row
                case 2:
                    print("tasas fila elegida ", row)
                    print("tasas componente elegido ",component)
                    self.tasasOrdenElegido = row
                case 3:
                    print("pagos fila elegida ", row)
                    print("pagos componente elegido ",component)
                    self.pagosOrdenElegido = row
                default: return
                }
      }
}

