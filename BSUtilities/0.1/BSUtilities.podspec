Pod::Spec.new do |s|
  s.name          = "BSUtilities"
  s.version       = "0.1"
  s.summary       = "iOS Utility classes which @danthorpe maintains and uses."
  s.homepage      = "http://blindingskies.com"

  s.license       = 'MIT'

  s.author        = { "Daniel Thorpe" => "dan@blindingskies.com" }

  s.platform      = :ios, '5.0'

  s.source        = { :git => "git@github.com:blindingskies/BSUtilities.git", :tag => "0.1" }
  s.source_files  = 'Sources/*/*.{h,m}'
  s.requires_arc  = true
  
end 