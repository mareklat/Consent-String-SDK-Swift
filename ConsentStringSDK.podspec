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
  s.author           = { 'Marek Latuszek' => 'hidden@email.com' }
  s.source           = { :git => 'https://github.com/mareklat/Consent-String-SDK-Swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.vendored_frameworks = 'build/Consent_String_SDK_Swift.xcframework'
  s.platform = :ios
end
