//
//  StoresAppApp.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-03.
//

import SwiftUI

@main
struct StoresAppApp: App {
    var body: some Scene {
        WindowGroup {
            StoreListView()
                .environment(\.colorScheme, .light)
        }
    }
}
