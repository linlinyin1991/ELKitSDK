Pod::Spec.new do |s|
  s.name             = 'ELKitSDK'
  s.version          = '0.2.2'
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
  s.frameworks = 'UIKit'
  s.subspec 'ELCategory' do |ss|
      ss.source_files = 'ELKitSDK/{UIView,NSDate,UIColor,NSString}+ELExtension.{h,m}'
      ss.public_header_files = 'ELKitSDK/ELCategory.h'
  end
  s.subspec 'ELViewInput' do |ss|
      ss.source_files = 'ELKitSDK/ELText{View,Field}.{h,m}'
      ss.public_header_files = 'ELKitSDK/ELText{View,Field}.h'
      ss.dependency 'ELKitSDK/ELViewCategory'
  end
  s.subspec 'Color' do |ss|
      ss.source_files = 'ELKitSDK/UIColor+ELExtension.{h,m}'
      ss.public_header_files = 'ELKitSDK/UIColor+ELExtension.h'
  end
  s.subspec 'String' do |ss|
      ss.source_files = 'ELKitSDK/NSString+ELExtension.{h,m}'
      ss.public_header_files = 'ELKitSDK/NSString+ELExtension.h'
  end
  s.subspec 'ELViewCategory' do |ss|
      ss.source_files = 'ELKitSDK/UIView+ELExtension.{h,m}'
      ss.public_header_files = 'ELKitSDK/UIView+ELExtension.h'
  end
  s.subspec 'ELDateModule' do |ss|
      ss.source_files = 'ELKitSDK/NSDate+ELExtension.{h,m}'
      ss.public_header_files = 'ELKitSDK/NSDate+ELExtension.h'
  end
end
