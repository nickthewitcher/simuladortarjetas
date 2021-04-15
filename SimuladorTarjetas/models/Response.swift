//
//  Response.swift
//  bootcampreto
//
//  Created by nickthewitcher on 4/14/21.
//

import Foundation
struct Response: Decodable {
    let tarjetas: Tarjetas
    let cuotas: [Int]
    let diasPagos, tea: [String]

    enum CodingKeys: String, CodingKey {
        case tarjetas, cuotas
        case diasPagos = "dias_pagos"
        case tea
    }
}
