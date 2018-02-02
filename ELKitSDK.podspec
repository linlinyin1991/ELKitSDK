Pod::Spec.new do |s|
  s.name             = 'ELKitSDK'
  s.version          = '0.1.0'
  s.summary          = '自己封装的常用SDK'
  s.description      = <<-DESC
TODO: 常用的SDK，方便之后创建新工程的时候使用.
                       DESC

  s.homepage         = 'https://github.com/linlinyin1991/ELKitSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ElaineYin' => 'linlinyin1991@163.com' }
  s.platform         = :ios, "8.0"
  s.source           = { :git => 'https://github.com/linlinyin1991/ELKitSDK.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.public_header_files = 'ELKitSDK/ELBaseKit.h'
  s.source_files = 'ELKitSDK/ELBaseKit.h'
  s.requires_arc = true
  
  s.subspec 'ELViewCategory' do |ss|
      ss.source_files = 'ELKitSDK/ELViewCategory/**/*'
      s.public_header_files = 'ELKitSDK/ELViewCategory/UIView+ELExtension.h'
  end
  s.subspec 'ELDateModule' do |ss|
      ss.source_files = 'ELKitSDK/ELDateModule/**/*'
      s.public_header_files = 'ELKitSDK/ELDateModule/NSDate+ELExtension.h'
  end
  # s.resource_bundles = {
  #   'ELKitSDK' => ['ELKitSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.frameworks = 'UIKit', 'MapKit'
  
end
