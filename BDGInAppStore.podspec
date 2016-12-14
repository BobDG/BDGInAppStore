Pod::Spec.new do |s|
  s.name           = 'BDGInAppStore'
  s.version        = '0.0.1'
  s.summary        = 'Lightweight wrapper for opening AppStore screens from within the App'
  s.license 	   = 'MIT'
  s.description    = 'Lightweight wrapper around storekit for opening AppStore screens from within the App, taking possible affiliate and campaign tokens into account'
  s.homepage       = 'https://github.com/BobDG/BDGInAppStore'
  s.authors        = {'Bob de Graaf' => 'graafict@gmail.com'}
  s.source         = { :git => 'https://github.com/BobDG/BDGInAppStore.git', :tag => '0.0.1' }
  s.source_files   = '*.{h,m}'  
  s.frameworks     = 'StoreKit'
  s.platform       = :ios
  s.requires_arc   = true
end
