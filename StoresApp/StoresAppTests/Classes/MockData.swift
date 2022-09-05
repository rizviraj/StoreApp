//
//  MockData.swift
//  StoresAppTests
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation
@testable import StoresApp


extension StoresData {
    static func withInfo() -> StoresData {
        let stores = Stores(id: "1", name: "Store Name Input", description: "61 Souli Point road North Sydney NSW 2060", image: "stores", distance: "2.7km", isDeliveryAvailable: true)
        let record = RecordData(stores: [stores])
        return StoresData(record: record)
    }
}
