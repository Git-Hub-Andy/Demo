Pod::Spec.new do |s|
  s.name         = "YZPClass"
  s.version      = "1.1.0"
  s.platform     = :ios, "9.0"
  s.summary      = "简介"
  s.homepage     = "https://github.com/Git-Hub-Andy/Demo.git"
  s.social_media_url = 'https://github.com/Git-Hub-Andy'
  s.license      = "MIT"
  s.author       = { "Andy" => "996901186@qq.com" }
  s.source       = { :git => 'https://github.com/Git-Hub-Andy/Demo.git',   :tag => "1.1.0"}
  s.requires_arc = true

  s.public_header_files = 'YZPClass/YZPHeader.h'
  s.source_files = 'YZPClass/YZPHeader.h'

# s.resource_bundles = {
#   'YZPClass' => ['YZPClass/Assets/*.png']
# }

  s.subspec 'Foundation+' do |ss|
    #包含Classes目录下的所有.h .m文件(多个目录用,分割)
    #'Classes/**/*.{h,m}'
  ss.source_files = 'YZPClass/Foundation+/**/*.{h,m}'
  end

  s.subspec 'UIKit+' do |ss|
   #包含Classes目录下的所有.h .m文件(多个目录用,分割)
   #'Classes/**/*.{h,m}'
  ss.source_files = 'YZPClass/UIKit+/**/*.{h,m}'
  end

  s.subspec 'Macro' do |ss|
  #包含Classes目录下的所有.h .m文件(多个目录用,分割)
  #'Classes/**/*.{h,m}'
  ss.source_files = 'YZPClass/Macro/**/*.{h,m}'
  end

  s.subspec 'Tool' do |ss|
    ss.subspec 'NetWork' do |sss|
    ss.source_files = 'YZPClass/Tool/NetWork/**/*.{h,m}'
    end
  end

  s.ios.dependency 'AFNetworking'
  s.ios.dependency 'MJExtension'
  s.ios.dependency 'UITableView+FDTemplateLayoutCell'
  s.ios.dependency 'MJRefresh'
  s.ios.dependency 'TZImagePickerController'
  s.ios.dependency 'SDWebImage'
  s.ios.dependency 'SDCycleScrollView'
  s.ios.dependency 'Masonry'
  s.ios.dependency 'YYCache'
  s.ios.dependency 'IQKeyboardManager'
  s.ios.dependency 'SVProgressHUD'

  #s.ios.dependency 'UMengUShare/Social/ReducedWeChat'    #集成微信(精简版0.2M)
  #s.ios.dependency 'UMengUShare/Social/ReducedQQ'    #集成QQ/QZone/TIM(精简版0.5M)
  #s.ios.dependency 'UMengUShare/Social/ReducedSina'   #集成新浪微博(精简版1M)

  #s.ios.dependency 'UMengUShare/Social/WeChat'     #集成微信(完整版14.4M)
  #s.ios.dependency 'UMengUShare/Social/QQ'  #集成QQ/QZone/TIM(完整版7.6M)
  #s.ios.dependency 'UMengUShare/Social/Sina'    #集成新浪微博(完整版25.3M)

  #s.ios.dependency 'WechatOpenSDK' # 集成微信
  #s.ios.dependency 'AlipaySDK-2.0' # 集成支付宝

end
