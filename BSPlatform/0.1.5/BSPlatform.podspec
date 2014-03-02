Pod::Spec.new do |s|
  
  s.name = "BSPlatform"
  s.version = "0.1.5"
  s.summary = "Blinding Skies iOS Platform"
  s.homepage = "http://www.blindingskies.com"
  s.license = "Closed"
  s.author = { "Daniel Thorpe" => "dan@blindingskies.com" }
  s.platform = :ios, '7.0'
  
  s.source = { :git => "git@github.com:blindingskies/BSPlatform.git", :tag => s.version }

  # Foundation Subspec
  s.subspec 'Foundation' do |foundation|
    
    foundation.source_files = "Foundation/source/*.{h,m}", "Foundation/source/Classes/*.{h,m}", "Foundation/source/Classes/**/*.{h,m}" 
    foundation.requires_arc = true
    
    foundation.prefix_header_contents = '''
#ifdef __OBJC__

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/DDLog.h>

#define BS_WEAK_SELF __weak __typeof(&*self)weakSelf = self;

#import "BSGlobalServices.h"
#import "BSApplication.h"
#import "BSAnalyticsService.h"
#import "BSAnalyticsEvent.h"
#import "BSAnalyticsErrorEvent.h"
#import "BSAnalyticsApplicationEvent.h"

#endif
'''    

    # Third Party Dependencies in Foundation
    foundation.dependency 'CocoaLumberjack', '~> 1.6.3'
    foundation.dependency 'Parse', '~> 1.2.17'
    foundation.dependency 'ReactiveCocoa', '~> 2.1.8'
    foundation.dependency 'Mixpanel', '~> 2.2.0'

  end

end
