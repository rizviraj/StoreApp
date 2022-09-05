//
//  StoresCellViewModel.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation

struct StoresCellViewModel: Identifiable {
    let id: String
    let name: String
    let description: String
    let image: String
    let distance: String
    let isDeliveryAvailable: Bool
    
    init(_ stores: Stores) {
        self.id = stores.id
        self.name = stores.name
        self.description = stores.description ?? ""
        self.image = stores.image ?? ""
        self.distance = stores.distance ?? ""
        self.isDeliveryAvailable = stores.isDeliveryAvailable
    }
    
    /*
        Use this method to change delivery icon based on the availability
     */
    func deliveryIcon() -> String {
        return isDeliveryAvailable ? "check" : "block"
    }
    
    /*
        Use this method to change delivery text color based on the availability
     */
    func deliveryText() -> String {
        return isDeliveryAvailable ? Constant.Color.blackText : Constant.Color.grayText
    }
}
