//
//  CustomError.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 10/03/2025.
//

import Foundation

enum CustomError: Error {
    case unknownError
    case noData
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknownError:
            "Unknown Error Occurred"
        case .noData:
            "No Data Found"
        }
    }
}
