#
# Be sure to run `pod lib lint UIKitExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIKitExtensions'
  s.version          = '0.1.0'
  s.summary          = 'A short description of UIKitExtensions.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dankinsoid/UIKitExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Voidilov' => 'voidilov@gmail.com' }
  s.source           = { :git => 'https://github.com/dankinsoid/UIKitExtensions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_versions = '5.0'
  s.source_files = 'UIKitExtensions/Classes/**/*'
  s.frameworks = 'UIKit'
end
