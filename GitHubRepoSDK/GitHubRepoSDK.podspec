
Pod::Spec.new do |spec|

  spec.name         = "GitHubRepoSDK"
  spec.version      = "1.0.0"
  spec.summary      = "This framework fetches list of repositories"
  spec.description  = "This framework fetches list of repositories depending upon platform and organization"
  spec.homepage     = "https://github.com/AbhijeetMallick/GitHubRepoSDK.git"
  spec.license      = "MIT"
  spec.author             = { "Abhijeet Mallick" => "mallickabhijeet387@gmail.com" }
  spec.platform     = :ios, "10.3"
  spec.source       = { :git => "https://github.com/AbhijeetMallick/GitHubRepoSDK.git", :tag => "1.0.0" }
  spec.source_files  = "GitHubRepoSDK/GitHubRepoSDK/**/*.{h,m,swift}"

end
