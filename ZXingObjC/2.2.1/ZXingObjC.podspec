Pod::Spec.new do |s|
  s.name                        = "ZXingObjC"
  s.version                     = "2.2.1"
  s.summary                     = "An Objective-C Port of ZXing."
  s.homepage                    = "https://github.com/TheLevelUp/ZXingObjC"
  s.author                      = "ZXing team (http://code.google.com/p/zxing/people/list) and TheLevelUp"

  s.license                     = { :type => 'Apache License 2.0', :file => 'COPYING' }

  s.source                      = { :git => "https://github.com/TheLevelUp/ZXingObjC.git", :tag => "2.2.1" }
  s.ios.deployment_target 	= '5.0'
  s.osx.deployment_target 	= '10.7'

  s.source_files                = 'ZXingObjC/**/*.{h,m}'
  s.requires_arc                = true

  s.ios.frameworks              = 'ImageIO', 'CoreGraphics', 'CoreVideo', 'CoreMedia', 'QuartzCore', 'AVFoundation', 'AudioToolbox'
  s.osx.frameworks              = 'CoreVideo', 'CoreMedia', 'QuartzCore', 'QTKit', 'ApplicationServices'
end
