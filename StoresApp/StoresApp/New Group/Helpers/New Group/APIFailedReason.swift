//
//  APIFailedReason.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import Foundation

enum APIFailedReason: Error {
    case noRecords
    case tryAgain
    case noInternet
    case badUrl
    case badRequest
    
    var message: String {
        switch self {
        case .noRecords:
            return "No records found"
        case .tryAgain:
            return "Something went wrong please try again"
        case .noInternet:
            return "No internet connection found"
        case .badUrl:
            return "Invalid url"
        case .badRequest:
            return "Bad url request"
        }
    }
}
