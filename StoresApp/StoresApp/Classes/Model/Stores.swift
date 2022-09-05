//
//  Stores.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation

struct StoresData: Codable{
    let record: RecordData
}

struct RecordData: Codable {
    let stores: [Stores]
}

struct Stores: Codable {
    let id: String
    let name: String
    let description: String?
    let image: String?
    let distance: String?
    let isDeliveryAvailable: Bool
}

