//
//  StoreListViewModelTests.swift
//  StoresAppTests
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import XCTest
@testable import StoresApp
import Combine
import SwiftUI

class StoreListViewModelTests: XCTestCase {

    private var canselable = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   /*
        Use to test when mock services is success
    */
    func testStoreDataSuccess() {
        let apiServer = MockAPIServerClient()
        let storeData = StoresData.withInfo()
        
        apiServer.getStoreList = .success(storeData)
        
        let viewModel = StoreListViewModel(apiServer)
        viewModel.fetchStoreData()
        
        let expectStoresCreated = expectation(description: "Fetch store request called")
        
        viewModel.$storesArray
            .sink(receiveValue: {stores in
                if let store = stores.first {
                    XCTAssertEqual(store.id, "1")
                    XCTAssertEqual(store.name, "Store Name Input")
                    XCTAssertEqual(store.description, "61 Souli Point road North Sydney NSW 2060")
                    XCTAssertEqual(store.image, "stores")
                    XCTAssertEqual(store.distance, "2.7km")
                    XCTAssertEqual(store.isDeliveryAvailable, true)
                }
                expectStoresCreated.fulfill()
            })
            .store(in: &canselable)
        
        wait(for: [expectStoresCreated], timeout: 0.2)
    }
    
    
    /*
         Use to test when mock services is bad url request
     */
    func testStoreDataFailedWithBadRequest() {
        let apiServer = MockAPIServerClient()
        
        apiServer.getStoreList = .failure(.badRequest)
        
        let viewModel = StoreListViewModel(apiServer)
        viewModel.fetchStoreData()
        
        let expectStoresCreated = expectation(description: "Fetch store request called")
        
        viewModel
            .$alertItems
                .sink { value in
                    if let newValue = value?.message {
                        let string = "Bad url request"
                        let textValue = Text(string)
                        XCTAssertEqual(newValue, textValue)
                    }
                    expectStoresCreated.fulfill()
                }.store(in: &canselable)
        
        wait(for: [expectStoresCreated], timeout: 0.2)
    }
    
    /*
         Use to test when mock services is try again
     */
    func testStoreDataFailedWithTryAgain() {
        let apiServer = MockAPIServerClient()
        
        apiServer.getStoreList = .failure(.tryAgain)
        
        let viewModel = StoreListViewModel(apiServer)
        viewModel.fetchStoreData()
        
        let expectStoresCreated = expectation(description: "Fetch store request called")
        
        viewModel
            .$alertItems
                .sink { value in
                    if let newValue = value?.message {
                        let string = "Something went wrong please try again"
                        let textValue = Text(string)
                        XCTAssertEqual(newValue, textValue)
                    }
                    expectStoresCreated.fulfill()
                }.store(in: &canselable)
        
        wait(for: [expectStoresCreated], timeout: 0.2)
    }
    
    /*
         Use to test when mock services is no records
     */
    func testStoreDataFailedWithEmpty() {
        let apiServer = MockAPIServerClient()
        
        apiServer.getStoreList = .none
        
        let viewModel = StoreListViewModel(apiServer)
        viewModel.fetchStoreData()
        
        let expectStoresCreated = expectation(description: "Fetch store request called")
        
        viewModel
            .$alertItems
                .sink { value in
                    if let newValue = value?.message {
                        let string = "No records found"
                        let textValue = Text(string)
                        XCTAssertEqual(newValue, textValue)
                    }
                    expectStoresCreated.fulfill()
                }.store(in: &canselable)
        
        wait(for: [expectStoresCreated], timeout: 0.2)
    }

}
