Pod::Spec.new do |s|
  s.name             = 'GTUIUtils'
  s.version          = '0.0.1'
  s.summary          = 'A collection of convenient classes for iOS.'
  s.homepage         = 'https://github.com/liuxc123/GTUIUtils'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuxc123' => 'lxc_work@126.com' }
  s.source           = { :git => 'https://github.com/liuxc123/GTUIUtils.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true


  s.public_header_files = 'GTUIUtils/**/*.h'
  s.source_files  = 'GTUIUtils/GTUIUtils.h'

  s.frameworks = 'UIKit', 'Foundation', 'CoreGraphics', 'QuartzCore'

  s.subspec 'Tool' do |ss|
    ss.source_files = 'GTUIUtils/Tool/*.{h,m}'
  end

  s.subspec 'Foundation' do |ss|
    ss.dependency 'GTUIUtils/Tool'
    ss.source_files = 'GTUIUtils/Foundation/*.{h,m}'
  end

  s.subspec 'UIKit' do |ss|
    ss.dependency 'GTUIUtils/Foundation'
    ss.source_files = 'GTUIUtils/UIKit/*.{h,m}'
  end

  s.subspec 'Helper' do |ss|
    ss.dependency 'GTUIUtils/UIKit'
    ss.dependency 'UITableView+FDTemplateLayoutCell', '~> 1.6'
    ss.source_files = 'GTUIUtils/Helper/*.{h,m}'
  end

end
