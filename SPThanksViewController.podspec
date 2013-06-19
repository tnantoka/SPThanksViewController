Pod::Spec.new do |s|
  s.name         = "SPThanksViewController"
  s.version      = "0.0.1"
  s.summary      = "Special thanks view with podfile-info."
  s.homepage     = "https://github.com/tnantoka/SPThanksViewController"
  s.license      = 'MIT'
  s.author       = { "tnantoka" => "bornneet@livedoor.com" }
  s.source       = { :git => "https://github.com/tnantoka/SPThanksViewController.git", :tag => "0.0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.requires_arc = true
  s.dependency  'Nimbus/WebController'
end
