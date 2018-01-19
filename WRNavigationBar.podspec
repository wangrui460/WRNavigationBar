
Pod::Spec.new do |s|

  s.name         = "WRNavigationBar"
  s.version      = "1.2.0"
  s.summary      = "navigationBar statusBar alpha color"
  s.homepage     = "https://github.com/wangrui460/WRNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "wangrui460" => "wangruidev@gmail.com" }
  s.social_media_url   = "http://weibo.com/wangrui460"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/wangrui460/WRNavigationBar.git", :tag => s.version }
  s.source_files  = "WRNavigationBar/*.{h,m}"
  s.requires_arc         = true

end
