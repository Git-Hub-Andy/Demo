Pod::Spec.new do |s|
s.name         = "YZPClass"
s.version      = "1.0.0"
s.platform     = :ios, "9.0"
s.summary      = "简介"
s.homepage     = "https://github.com/Git-Hub-Andy/Demo.git"
s.social_media_url = 'https://github.com/Git-Hub-Andy'
s.license      = "MIT"
s.author       = { "Andy" => "996901186@qq.com" }
s.source       = { :git => 'https://github.com/Git-Hub-Andy/Demo.git', :tag => "1.0.0"}
s.requires_arc = true
s.source_files = 'YZPClass/*'
#s.public_header_files = 'runtime/TFRuntimeManager.h'
s.ios.dependency 'MBProgressHUD'

end
