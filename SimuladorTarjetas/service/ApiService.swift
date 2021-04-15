//
//  ApiService.swift
//  bootcampreto
//
//  Created by nickthewitcher on 4/14/21.
//

import Foundation
import Alamofire
import RxSwift

class ApiService{
    let api :Api
    static let sharedInstance: ApiService = {
       let instance = ApiService()
        return instance
    }()
    private init(){
        self.api = Api.sharedInstance
    }
    
    func getSimulator() -> Observable<Simulator>{
        return Observable.create { [weak self] observer -> Disposable in
            self?.api.session.request(Environments.apiURL)
                .validate()
                .responseDecodable(of: Simulator.self) { result in
                    switch result.result {
                    case .success(let simulator):
                        observer.onNext(simulator)
                    case .failure(let error): observer.onError(error)
                    }
            }
                    return Disposables.create()
                }}


}







   /*
    func getSimulatorComplete() {
        self.api.session.request(Environments.apiURL)
            .validate()
            .responseDecodable(of: Simulator.self) {
                (response) in
            guard let simulators = response.value
            else { return }
                print(simulators.code)
                print(simulators.response.cuotas)
                print(simulators.response.diasPagos)
                print(simulators.response.tarjetas)
                print(simulators.response.tea)
            }
    }*/
    
    
//    Zona de comentarios utiles
//    func getSim(){
//           AF.request(Environments.apiURL).responseSimulator { response in
//             if let simulator = response.result.value {
//
//             }
//           }
//    }
    
//    func getSimulator(completion: @escaping (_ response: Result<[Simulator], Error>) -> Void) {
//
//        self.api.session.request(Environments.apiURL)
//            .response{
//                (response) in debugPrint(response)
//            }
//        }
    
    //   Alamofire.request(url).responseSimulator { response in
    //     if let simulator = response.result.value {
    //       ...
    //     }
    //   }
    
    //works
//    func getSimulator() {
//
//        self.api.session.request(Environments.apiURL)
//            .response{
//                (response) in debugPrint(response)
//            }
//        }
