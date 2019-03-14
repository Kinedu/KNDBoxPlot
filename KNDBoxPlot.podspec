#
# Be sure to run `pod lib lint KNDBoxPlot.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KNDBoxPlot'
  s.version          = '0.1.2'
  s.summary          = 'This library was created with the purpose of helping to show information in the form of Box Plot'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#  s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                       DESC

  s.homepage         = 'https://github.com/Kinedu/KNDBoxPlot.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'roger.contreras.vl@gmail.com' => 'roger@kinedu.com' }
  s.source           = { :git => 'https://github.com/Kinedu/KNDBoxPlot.git', :tag => '0.1.2' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Classes/*.{swift, xib}'
  s.resources = 'Classes/*.xib'
  
   s.resource_bundles = {
     'KNDBoxPlot' => ['Classes/*.xib']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
