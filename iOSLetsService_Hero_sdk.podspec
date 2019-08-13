#
# Be sure to run `pod lib lint iOSLetsService_Hero_sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iOSLetsService_Hero_sdk'
  s.version          = '0.1.0'
  s.summary          = 'Implementation For Hero.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Implementation For Hero.
                       DESC

  s.homepage         = 'https://github.com/DivyaLets/iOSLetsService_Hero_sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DivyaLets' => 'divyasree.pavani@letsservice.in' }
  s.source           = { :git => 'https://github.com/DivyaLets/iOSLetsService_Hero_sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_versions = '5.0'

  s.source_files = 'iOSLetsService_Hero_sdk/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iOSLetsService_Hero_sdk' => ['iOSLetsService_Hero_sdk/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   
   s.dependency 'Alamofire', '~> 4.7'
   s.dependency 'SwiftyJSON', '~> 4.0'
   s.dependency 'AlamofireObjectMapper', '~> 5.0'
   s.dependency 'AlamofireImage', '~> 3.4'
   s.dependency 'AlamofireObjectMapper', '~> 5.2'
   s.static_framework = true
   
  # s.dependency 'AFNetworking', '~> 2.3'
end
