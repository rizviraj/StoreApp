//
//  AlertItems.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation
import SwiftUI

struct AlertItems: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let alertButton: Alert.Button?
}
