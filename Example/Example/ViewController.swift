//
//  ViewController.swift
//  Example
//
//  Created by Abhijeet Mallick on 13/12/19.
//  Copyright © 2019 Abhijeet Mallick. All rights reserved.
//

import UIKit
import GitHubRepoSDK
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fetchRepositories(_ sender: UIButton) {
        SearchRepoDataService.fetcRepositories(with: "ios", organization: "rakutentech") { (result) in
            switch result {
            case .success(let response):
                print(response ?? "")
            case .failure(let error):
                switch error {
                case .apiError(error: let error):
                    print("Error occurred \(error.localizedDescription)" )
                default:
                    print(error.errorDescription)
                }
            }
        }
    }
    
}

