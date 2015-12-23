#
# Be sure to run `pod lib lint LSAPIClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LSAPIClient"
  s.version          = "0.0.1"
  s.summary          = "Local storage alternative to Lampo's Hypermedia APIs."
  s.description      = <<-DESC
						Provides methods compatible with the LHAPICLient (which accesses Lampo's Hypermedia APIs), except it performs local storage.
                       DESC
  s.homepage         = "http://www.google.com"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Joe McSorley" => "joe.mcsorley@daveramsey.com" }
  s.source           = { :git => "https://github.com/joemcsorley/ios-local-storage-client.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = 'Pod/**/*.{h,m,swift}'
  s.resource_bundles = {
    'LHAPIClient' => ['Pod/Assets/*.png']
  }
  s.libraries = 'sqlite3', 'z'

  s.dependency 'CocoaLumberjack',    '2.0.3'
  s.dependency 'PromiseKit',         '1.6.0'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'SystemConfiguration', 'CFNetwork', 'Security', 'CouchbaseLite'
end
