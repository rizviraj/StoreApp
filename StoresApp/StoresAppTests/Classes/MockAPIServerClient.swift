//
//  MockAPIServerClient.swift
//  StoresAppTests
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation
@testable import StoresApp
import Combine

class MockAPIServerClient: APIServerClientDelegate {
    
    var getStoreList: Result<StoresData, APIFailedReason>?
    
    func getData<T: Decodable>() -> Future<T, Error> {
        return Future<T, Error> {[weak self] promise in
            switch self!.getStoreList {
            case .success(let storeData):
                promise(.success(storeData as! T))
            case .failure(let error):
                promise(.failure(error))
            case .none:
                promise(.failure(APIFailedReason.noRecords))
            }
        }
    }
    
}
