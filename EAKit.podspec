Pod::Spec.new do |s|
  s.name                  = 'EAKit'
  s.version               = '1.0.2'
  s.summary               = 'A collection of Swift extensions.'

  s.homepage              = 'https://github.com/Meniny/EAKit'
  s.license               = { :type => 'MIT', :file => 'LICENSE.md' }
  s.authors               = { 'Elias Abel' => 'admin@meniny.cn' }
  s.source                = { :git => 'https://github.com/Meniny/EAKit.git', :tag => s.version.to_s }
  s.social_media_url      = 'https://meniny.cn'
  # s.screenshot       = ''

  s.swift_version         = "4.0"

  s.ios.deployment_target = '8.0'
  s.ios.framework         = 'Foundation', 'UIKit'
  # s.ios.dependency         'Kingfisher'

  s.osx.deployment_target = '10.9'
  s.osx.framework         = 'Cocoa'

  s.source_files          = "EAKit/**/*.{h,swift}"
  # s.resources        = ["EAKit/EAKit.bundle"]

  s.module_name           = 'EAKit'
end
