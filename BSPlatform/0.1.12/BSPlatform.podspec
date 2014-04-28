Pod::Spec.new do |s|
  s.name = "BSPlatform"
  s.version = "0.1.12"
  s.summary = "Blinding Skies iOS Platform"
  s.homepage = "http://www.blindingskies.com"
  s.license = "Closed"
  s.author = { "Daniel Thorpe" => "dan@blindingskies.com" }
  s.platform = :ios, '7.0'
  s.source = { :git => "git@github.com:blindingskies/BSPlatform.git", :tag => "#{s.version}" }

  # Tests
  s.subspec 'Tests' do |tests|
    # TODO: Expose test cases, harnesses, Mocks, Fakes etc from the Platform here.
    tests.dependency 'OCMock'
  end
    
  # Production
  s.subspec 'Production' do |prod|

    # Foundation Subspec
    prod.subspec 'Foundation' do |foundation|
      foundation.requires_arc = true
      foundation.prefix_header_contents = '''
  #ifdef __OBJC__
  #import <BSPlatform/BSDefines.h>
  #endif
  '''
      # Core
      foundation.subspec 'Core' do |core|
        core.source_files = 'Foundation/source/Foundation.h', 'Foundation/source/BSDefines.h', 'Foundation/source/core/*.{h,m}'
        core.dependency 'CocoaLumberjack', '= 1.6.3'        
      end

      # Legacy
      foundation.subspec 'Legacy' do |legacy|
        legacy.source_files = 'Foundation/source/legacy/*.{h,m}', 'Foundation/source/legacy/**/*.{h,m}'
        legacy.prefix_header_contents = '''
  #ifdef __OBJC__

  #import <Foundation/Foundation.h>
  #import <CocoaLumberjack/DDLog.h>

  #import "BSGlobalServices.h"
  #import "BSApplication.h"
  #import "BSAnalyticsService.h"
  #import "BSAnalyticsEvent.h"
  #import "BSAnalyticsErrorEvent.h"
  #import "BSAnalyticsApplicationEvent.h"

  #endif
  '''    
        legacy.dependency 'BSPlatform/Production/Foundation/Core'  
        legacy.dependency 'ReactiveCocoa', '~> 2.1.8'
      end
    end

    # UI
    prod.subspec 'UI' do |ui|

      ui.source_files = "UI/source/*.{h,m}", "UI/source/**/*.{h,m}" 
      ui.requires_arc = true
      ui.frameworks = 'UIKit'
      ui.dependency 'BSPlatform/Production/Foundation/Core'
    end
  end
end
