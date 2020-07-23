#
# Be sure to run `pod lib lint AuthTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AuthTextField'
  s.version          = '0.1.2'
  s.summary          = 'AuthTextField is a easy solution for your auth screen. Include lots of template and animations.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
        'AuthTextField is a simple way to create auth screens with nice UI and animations. Its simple to use.'
                        DESC

  s.homepage         = 'https://github.com/ferhanakkan/AuthTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ferhanakkan' => 'ferhanakkan@gmail.com' }
  s.source           = { :git => 'https://github.com/ferhanakkan/AuthTextField.git', :tag => s.version.to_s }
#   s.social_media_url = 'https://www.linkedin.com/in/ferhanakkan'

  s.ios.deployment_target = '12.0'
  s.swift_version = "5.0"
  s.platforms = {
      "ios": "12.0"
  }

  s.source_files = 'Source/*.{h,m,swift}'
  s.resource = 'Example/Pods/Resources/**/*'
  
#   s.resource_bundles = {
#     'AuthTextField' => ['AuthTextField/Assets/*.png']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
