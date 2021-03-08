
Pod::Spec.new do |spec|
  spec.ios.deployment_target  = '14.0'
  spec.name         = 'SwiftUIToastManager'
  spec.version      = '1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/YuantongL/SwiftUIToastManager'
  spec.summary      = 'A manager to manage on screen toast views coming from bottom of the screen'
  spec.authors      = { 'Yuantong Lu' => 'lytgopro@gmail.com' }
  spec.source       = { :git => 'https://github.com/YuantongL/SwiftUIToastManager', :tag => spec.version }
  spec.source_files = 'Source/**/*.swift'
  spec.requires_arc = true
end
