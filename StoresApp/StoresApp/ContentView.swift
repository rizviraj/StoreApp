//
//  ContentView.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-03.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = StoreListViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
