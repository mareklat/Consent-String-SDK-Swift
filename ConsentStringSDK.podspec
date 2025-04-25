# ConsentStringSDK.podspec
Pod::Spec.new do |s|
  s.name             = 'ConsentStringSDK'
  s.version          = '1.0.0'
  s.summary          = 'Fork of IAB Consent String SDK Swift with XCFramework support.'
  s.description      = <<-DESC
                       This is a fork of the official IAB Consent String SDK for Swift,
                       packaged as an XCFramework for easier integration.
                       It resides in the 'build' directory of the repository.
                       DESC
  s.homepage         = 'https://github.com/mareklat/Consent-String-SDK-Swift'
  # s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/mareklat/Consent-String-SDK-Swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.vendored_frameworks = 'build/Consent_String_SDK_Swift.xcframework'
  s.platform = :ios
end
