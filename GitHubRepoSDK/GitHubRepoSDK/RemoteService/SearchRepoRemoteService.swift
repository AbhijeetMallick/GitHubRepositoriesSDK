//
//  SearchRepoRemoteService.swift
//  GitHubRepoSDK
//
//  Created by Abhijeet Mallick on 13/12/19.
//  Copyright © 2019 Abhijeet Mallick. All rights reserved.
//

import Foundation


// This Class is responsible for fetching response from backend and return Data

// Suppose in future there comes requirement, to change from "URLSession" to other ways (like Third party
// libraries) for fetching data from backend. Then the modification can be done only in this class, without affecting the other class like how to data parsing (SearchRepoDataService) or UIViews

internal class SearchRepoRemoteService {
    var baseURL: String
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    // MARK: Search Repository
    // Function to fetch repositories from backend
    func searchRepository(with mobilePlatform: String, organization: String, completion: @escaping (Result<(Data)>) -> Void)  {
        let stringURL = self.baseURL + "/search/repositories?q=\(mobilePlatform)+org:\(organization)"
        
        guard let url = URL(string: stringURL) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard error == nil, let data = data   else {
                completion(.failure(.apiError(error: error!)))
                return
            }
            
            completion(.success(data))
        })
        task.resume()
    }
    
}
