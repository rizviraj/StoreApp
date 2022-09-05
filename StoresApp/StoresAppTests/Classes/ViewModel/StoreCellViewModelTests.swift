//
//  StoreCellViewModelTests.swift
//  StoresAppTests
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import XCTest
@testable import StoresApp


class StoreCellViewModelTests: XCTestCase {

    let store = StoresData.withInfo().record.stores.first
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*
        Used to test cell view model
     */
    func testStoreCellViewModel() {
        if let store = store {
            let cellViewModel = StoresCellViewModel(store)
            
            XCTAssertEqual(store.id, cellViewModel.id)
            XCTAssertEqual(store.name, cellViewModel.name)
            XCTAssertEqual(store.description, cellViewModel.description)
            XCTAssertEqual(store.image, cellViewModel.image)
            XCTAssertEqual(store.distance, cellViewModel.distance)
            XCTAssertEqual(store.isDeliveryAvailable, true)
        }
    }
    
    /*
        Used to test delivery icon based is delivery available
     */
    func testDeliveryIcon() {
        if let store = store {
            let cellViewModel = StoresCellViewModel(store)
            
            XCTAssertEqual(cellViewModel.deliveryIcon(), "check")
        }
    }
    
    /*
        Used to test delivery test color based on delivery available
     */
    func testDeliveryTextColor() {
        if let store = store {
            let cellViewModel = StoresCellViewModel(store)
            
            XCTAssertEqual(cellViewModel.deliveryText(), Constant.Color.blackText)
        }
    }
    
}
