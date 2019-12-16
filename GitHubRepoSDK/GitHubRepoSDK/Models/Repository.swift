//
//  Repository.swift
//  GitHubRepoSDK
//
//  Created by Abhijeet Mallick on 13/12/19.
//  Copyright © 2019 Abhijeet Mallick. All rights reserved.
//

import Foundation


// Model to decode each repository item
public struct Repository {
    let name: String?
    let privacyStatus: Bool?
    let description: String?
    let language: String?
}

extension Repository: Decodable {
    enum RepositoryCodingKeys: String, CodingKey {
        case name
        case privacyStatus = "private"
        case description
        case language
    }
    
    
    public init(from decoder: Decoder) throws {
        let repositoryContainer = try decoder.container(keyedBy: RepositoryCodingKeys.self)
        
        name = try repositoryContainer.decodeIfPresent(String.self, forKey: .name)
        privacyStatus = try repositoryContainer.decodeIfPresent(Bool.self, forKey: .privacyStatus)
        description = try repositoryContainer.decodeIfPresent(String.self, forKey: .description)
        language = try repositoryContainer.decodeIfPresent(String.self, forKey: .language)
    }
}
