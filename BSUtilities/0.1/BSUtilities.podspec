Pod::Spec.new do |s|
  s.name          = "BSUtilities"
  s.version       = "0.1"
  s.summary       = "iOS utility classes which @danthorpe maintains and uses."
  s.homepage      = "http://blindingskies.com"

  s.license       = 'MIT'
  s.author        = { "Daniel Thorpe" => "dan@blindingskies.com" }

  s.platform      = :ios, '5.0'
  s.source        = { :git => "git@github.com:blindingskies/BSUtilities.git", :tag => "0.1" }  

  # Classes
  s.subspec 'Classes' do |classes|
    classes.source_files = "Sources/Classes/*.{h,m}", "Sources/Classes/*/*.{h,m}"
    classes.requires_arc = true
  end

  # Categories
  s.subspec 'Categories' do |categories|
    categories.source_files = "Sources/Categories/*.{h,m}"
    categories.requires_arc = true
  end
  
end 