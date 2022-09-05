//
//  StoreListViewModel.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation
import Combine
import SwiftUI

final class StoreListViewModel: ObservableObject {
    
    private var apiServer: APIServerClientDelegate?
    private var cancelable = Set<AnyCancellable>()
        
    @Published var storesArray = [StoresCellViewModel]()
    @Published var isLoading: Bool = false
    @Published var alertItems: AlertItems?
    @Published var search: String = ""
    @Published private var storesData: StoresData?
    private var allStores = [StoresCellViewModel]()
    
    init(_ apiServer: APIServerClientDelegate = APIServerClient()) {
        self.apiServer = apiServer
        
        checkValues()
        
        filterStores()
    }
    
    /*
        Use this method to fetch Store list from remote server
     */
    func fetchStoreData() {
        isLoading = true
        apiServer?.getData()
            .sink { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    let message = error as? APIFailedReason
                    self.alertItems = AlertItems(title: Text("Error!"), message: Text(message?.message ?? "Try Again"), alertButton: .default(Text("OK")))
                case .finished:
                    print("Completed")
                }
            } receiveValue: {[weak self] stores in
                self?.storesData = stores
            }
            .store(in: &cancelable)
    }
    
    /*
        Used to convert into storeCellViewModel
     */
    func checkValues(){
        $storesData.sink(receiveValue: {values in
            if let values = values {
                self.allStores = values.record.stores.map{ return StoresCellViewModel($0)}
                self.storesArray = self.allStores
            }
        }).store(in: &cancelable)
    }
    
    /*
        Use this method to filter stores
     */
    func filterStores() {
        $search.sink(receiveValue: { search in
            if search.isEmpty {
                self.storesArray = self.allStores
            } else {
                self.storesArray = self.allStores.filter { $0.name.localizedCaseInsensitiveContains(search) }
            }
        }).store(in: &cancelable)
    }
    
}
