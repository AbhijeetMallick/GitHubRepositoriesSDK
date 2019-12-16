# GitHubRepositoriesSDK

GitHubRepositoriesSDK is a Swift framework for fetching list of repositories.
It takes two parameters as input (the mobile platform and the organization name) and returns an array of model class.

To directly run and test the SDK, there is an Example project added, where on button click user can see the list of repositries on console.

## Installation

Download the Zip file of the repositor.

```bash
Download the Zip file of the repository.
Drag and drop the GitHubRepoSDK.xcodeproj from the GitHubRepoSDK folder into your iOS project.
Embed framework into the project target
```

![](/screenshot1.png?raw=true "Optional Title")


![](/screenshot.png?raw=true "Optional Title")

## Usage

```python
import GitHubRepoSDK

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
```



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
