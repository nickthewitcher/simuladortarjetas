//
//  Api.swift
//  bootcampreto
//
//  Created by nickthewitcher on 4/14/21.
//  Esta es una api que usa singleton

import Foundation
import Alamofire
class Api{
    let storage = KeychainStorage()
    let session : Session
    public static let sharedInstance: Api = {
        let instance = Api()
        return instance
    }()
    init() {
        self.session =  Session(interceptor: RequestInterceptor(storage: storage))
    }
}

