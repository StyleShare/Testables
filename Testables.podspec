Pod::Spec.new do |s|
  s.name             = "Testables"
  s.version          = "0.2.0"
  s.summary          = "Make private properties testable"
  s.homepage         = "https://github.com/StyleShare/Testables"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/StyleShare/Testables.git",
                         :tag => s.version.to_s }
  s.source_files = "Sources/Testables/*.{swift,h,m}"
  s.frameworks   = "Foundation"
  s.swift_version = "5.0"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
end
