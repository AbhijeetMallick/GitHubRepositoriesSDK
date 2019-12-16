//
//  GitHubRepoSDKTests.swift
//  GitHubRepoSDKTests
//
//  Created by Abhijeet Mallick on 13/12/19.
//  Copyright © 2019 Abhijeet Mallick. All rights reserved.
//

import XCTest
@testable import GitHubRepoSDK

class GitHubRepoSDKTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Mark: Fetch and Parse repositories
    func testParsingGitHubRepositories() {
        var fetchedRepositories: [Repository]?
        var fetchedError: APIServiceError?
        
        
        let parsingExpectation = expectation(description: "Fetch Data")
        
        SearchRepoDataService.fetcRepositories(with: "iOS", organization: "rakutentech") { (response) in
            switch response {
            case .success(let result):
                fetchedRepositories = result
            case .failure(let error):
                fetchedError = error
            }
            parsingExpectation.fulfill()
        }
        wait(for: [parsingExpectation], timeout: 10.0)
        
        
        XCTAssertNil(fetchedError, "Failed to fetch data due to \(String(describing: fetchedError?.localizedDescription))")
        
        guard let result = fetchedRepositories else {
            return XCTFail("No data found")
        }
        XCTAssertTrue(result.count > 0, "No repository for given parameters")
        XCTAssert(type(of: result) == Array<Repository>.self, "The returned array is not of Repository model type")
    }

}
