//
//  Utility.swift
//  GitHubRepoSDK
//
//  Created by Abhijeet Mallick on 13/12/19.
//  Copyright © 2019 Abhijeet Mallick. All rights reserved.
//

import Foundation

// Enum to get success or failure
public enum Result<T> {
    case success(T)
    case failure(APIServiceError)
}

// Custom Enum to provide which type of Error occurred
public enum APIServiceError: LocalizedError {
    
    case apiError(error: Error)
    case invalidEndpoint
    case decodeError(error: Error)
    
    
    public var errorDescription: String {
        switch self {
        case .invalidEndpoint:
            return "Cannot URL in not proper"
        case .decodeError:
            return "Unable to load repositories, please try later"
        default:
            return "Unknown error occurred "
        }
    }
}
