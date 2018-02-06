Pod::Spec.new do |s|
  s.name        = 'EAKit'
  s.module_name = 'EAKit'
  s.version     = '1.2.3'
  s.summary     = 'A huge collection of native Swift extensions to boost your productivity.'

  s.homepage    = 'https://github.com/Meniny/EAKit'
  s.license     = { type: 'MIT', file: 'LICENSE.md' }
  s.authors     = { 'Elias Abel' => 'admin@meniny.cn' }
  s.social_media_url = 'https://meniny.cn/'
  # s.screenshot = ''

  s.ios.deployment_target     = '8.0'
  s.osx.deployment_target     = '10.10'
#  s.tvos.deployment_target    = '9.0'
#  s.watchos.deployment_target = '2.0'

  s.requires_arc        = true
  s.source              = { git: 'https://github.com/Meniny/EAKit.git', tag: s.version.to_s }
  s.source_files        = 'EAKit/**/*.swift'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.swift_version       = '4.0'
  # s.documentation_url   = 'https://meniny.cn/EAKit/docs'

  # SwiftStdlib Extensions
  s.subspec 'Core' do |sp|
    sp.source_files  = 'EAKit/Core/**/*.swift'
  end

  # Foundation Extensions
  s.subspec 'Foundation' do |sp|
    sp.source_files  = 'EAKit/Foundation/**/*.swift'
    sp.dependency      'EAKit/Core'
  end

  # UIKit Extensions
  s.subspec 'UIKit' do |sp|
    sp.source_files  = 'EAKit/UIKit/**/*.swift'
    sp.dependency      'EAKit/Core'
  end

  # AppKit Extensions
  s.subspec 'AppKit' do |sp|
    sp.source_files  = 'EAKit/AppKit/**/*.swift'
    sp.dependency      'EAKit/Core'
  end

  # CoreGraphics Extensions
  s.subspec 'CoreGraphics' do |sp|
    sp.source_files  = 'EAKit/CoreGraphics/**/*.swift'
    sp.dependency      'EAKit/Core'
  end

  # CoreLocation Extensions
  s.subspec 'CoreLocation' do |sp|
    sp.source_files  = 'EAKit/CoreLocation/**/*.swift'
    sp.dependency      'EAKit/Core'
  end

  # Testing Extensions
  s.subspec 'Testing' do |sp|
    sp.source_files  = 'EAKit/Testing/**/*.swift'
  end

  # Sysctl Extensions
  s.subspec 'sysctl' do |sp|
    sp.source_files  = 'EAKit/sysctl/**/*.swift'
  end

  # OCRuntime Extensions
  s.subspec 'Runtime' do |sp|
    sp.source_files  = 'EAKit/Runtime/**/*.swift'
  end
end
