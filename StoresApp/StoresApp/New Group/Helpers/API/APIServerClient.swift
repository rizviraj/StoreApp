//
//  APIServerClient.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation
import Combine

protocol APIServerClientDelegate {
    func getData<T: Decodable>() -> Future<T, Error>
}

class APIServerClient: APIServerClientDelegate {
    private var cancelable = Set<AnyCancellable>()
    
    /*
        Use this Generic method to call network request
     */
    func getData<T: Decodable>() -> Future<T, Error> {
        return Future<T, Error> {[weak self] promise in
            guard let url = URL(string: Constant.App.baseUrl) else {
                return promise(.failure(APIFailedReason.badUrl))
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue(Constant.App.apiKey, forHTTPHeaderField: "X-MASTER-KEY")
            
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap{ data, response -> Data in
                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        throw APIFailedReason.badRequest
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let apiError as APIFailedReason:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(APIFailedReason.noRecords))
                        }
                    }
                }, receiveValue: {response in
                    promise(.success(response))
                })
                .store(in: &self!.cancelable)
        }
    }
    
    
}
