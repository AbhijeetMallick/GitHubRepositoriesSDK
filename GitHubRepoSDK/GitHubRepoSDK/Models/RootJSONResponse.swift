//
//  RootJSONResponse.swift
//  GitHubRepoSDK
//
//  Created by Abhijeet Mallick on 13/12/19.
//  Copyright © 2019 Abhijeet Mallick. All rights reserved.
//

import Foundation

// Model to decode each root level JSON response item
struct RootJSONResponse: Decodable {
    let items: [Repository]?
    
    enum RootJSONResponseCodingKeys: String, CodingKey {
        case items
    }
    
    
    init(from decoder: Decoder) throws {
        let jsonResponseContainer = try decoder.container(keyedBy: RootJSONResponseCodingKeys.self)
        
        items = try jsonResponseContainer.decodeIfPresent([Repository].self, forKey: .items)
    }
}
