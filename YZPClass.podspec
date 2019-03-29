Pod::Spec.new do |s|
s.name         = "YZPClass"
s.version      = "1.0.17"
s.platform     = :ios, "9.0"
s.summary      = "简介"
s.homepage     = "https://github.com/Git-Hub-Andy/Demo.git"
s.social_media_url = 'https://github.com/Git-Hub-Andy'
s.license      = "MIT"
s.author       = { "Andy" => "996901186@qq.com" }
s.source       = { :git => 'https://github.com/Git-Hub-Andy/Demo.git', :tag => "1.0.17"}
s.requires_arc = true

s.public_header_files = 'YZPClass/**/*.{h}'

#包含Classes目录下的所有.h .m文件(多个目录用,分割)
#'Classes/**/*.{h,m}'
s.source_files = 'YZPClass/Foundation+/**/*.{h,m}','YZPClass/UIKit+/**/*.{h,m}','YZPClass/Macro/**/*.{h}','YZPClass/BaseClass/M/**/*.{h,m}','YZPClass/BaseClass/V/**/*.{h,m}','YZPClass/BaseClass/C/**/*.{h,m}','YZPClass/AppDelegate+/**/*.{h,m}','YZPClass/Tool/NetWork/**/*.{h,m}'


s.ios.dependency 'AFNetworking'
s.ios.dependency 'MJExtension'
s.ios.dependency 'UITableView+FDTemplateLayoutCell'
s.ios.dependency 'MJRefresh'
s.ios.dependency 'TZImagePickerController'
s.ios.dependency 'SDWebImage'
s.ios.dependency 'SDCycleScrollView'
s.ios.dependency 'FDFullscreenPopGesture'
s.ios.dependency 'Masonry'
s.ios.dependency 'FMDB'
s.ios.dependency 'YYCache'
s.ios.dependency 'IQKeyboardManager'
s.ios.dependency 'SVProgressHUD'

#s.ios.dependency 'UMengUShare/Social/ReducedWeChat'    #集成微信(精简版0.2M)
#s.ios.dependency 'UMengUShare/Social/ReducedQQ'  #集成QQ/QZone/TIM(精简版0.5M)
#s.ios.dependency 'UMengUShare/Social/ReducedSina'   #集成新浪微博(精简版1M)

#s.ios.dependency 'UMengUShare/Social/WeChat'     #集成微信(完整版14.4M)
#s.ios.dependency 'UMengUShare/Social/QQ'  #集成QQ/QZone/TIM(完整版7.6M)
#s.ios.dependency 'UMengUShare/Social/Sina'    #集成新浪微博(完整版25.3M)

#s.ios.dependency 'WechatOpenSDK' # 集成微信
#s.ios.dependency 'AlipaySDK-2.0' # 集成支付宝

end
