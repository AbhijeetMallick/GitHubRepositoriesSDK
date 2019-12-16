//
//  SearchRepoDataService.swift
//  GitHubRepoSDK
//
//  Created by Abhijeet Mallick on 13/12/19.
//  Copyright © 2019 Abhijeet Mallick. All rights reserved.
//

import Foundation

// Class to Parse the JSON data into Model and return back the model array
// This is the entry level

// If at some point in future there is a need to change the implementation to
// parsing JSON data then we only have to touch this class rest of the code for
// fetch data from backend remains same.
// For exampe we don't want to go with "Codable" approach for parsing then we can change here.

public class SearchRepoDataService {
    
    private init() { }
    
    // MARK: Search and parse Repository
    // Function to parse data object into  array of Repository model
    public static func fetcRepositories(with mobilePlatform: String, organization: String, completion: @escaping (Result<([Repository]?)>) -> Void)  {

        let repoAPIService = SearchRepoRemoteService(baseURL: "https://api.github.com")
        
        repoAPIService.searchRepository(with: mobilePlatform, organization: organization) { (response) in
            switch response {
            case .success(let data):
                do {
                    let rootJSONResponse = try JSONDecoder().decode(RootJSONResponse.self, from: data)
                    print("The fetched respositories are \(String(describing: rootJSONResponse.items))")
                    completion(.success(rootJSONResponse.items))
                } catch let error {
                    print("Error \(error.localizedDescription)")
                    completion(.failure(.decodeError(error: error)))
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
