Pod::Spec.new do |s|
s.name         = "YZPClass"
s.version      = "1.0.1"
s.platform     = :ios, "9.0"
s.summary      = "简介"
s.homepage     = "https://github.com/Git-Hub-Andy/Demo.git"
s.social_media_url = 'https://github.com/Git-Hub-Andy'
s.license      = "MIT"
s.author       = { "Andy" => "996901186@qq.com" }
s.source       = { :git => 'https://github.com/Git-Hub-Andy/Demo.git', :tag => "1.0.1"}
s.requires_arc = true
s.source_files = 'YZPClass/*'
s.public_header_files = 'YZPClass/YZPHeader.h'


s.subspec 'Foundation+' do |ss|
ss.ios.deployment_target = '9.0'
ss.source_files = 'YZPClass/*'
end

s.subspec 'BaseClass' do |ss|
ss.ios.deployment_target = '9.0'
ss.source_files = 'YZPClass/*'
end


s.ios.dependency 'AFNetworking'
s.ios.dependency 'MJExtension'
s.ios.dependency 'UITableView+FDTemplateLayoutCell'
#tableView高度自适应
s.ios.dependency 'MJRefresh'
s.ios.dependency 'TZImagePickerController'
s.ios.dependency 'SDWebImage'
s.ios.dependency 'SDCycleScrollView'
s.ios.dependency 'FDFullscreenPopGesture' #全屏侧滑返回
s.ios.dependency 'Masonry'                #自动布局
s.ios.dependency 'FMDB'
s.ios.dependency 'YYCache'
s.ios.dependency 'IQKeyboardManager'
s.ios.dependency 'SVProgressHUD'

#s.ios.dependency 'UMengUShare/Social/ReducedWeChat'    #集成微信(精简版0.2M)
#s.ios.dependency 'UMengUShare/Social/ReducedQQ'  #集成QQ/QZone/TIM(精简版0.5M)
#s.ios.dependency 'UMengUShare/Social/ReducedSina'   #集成新浪微博(精简版1M)

#  pod 'UMengUShare/Social/WeChat'     #集成微信(完整版14.4M)
#  pod 'UMengUShare/Social/QQ'  #集成QQ/QZone/TIM(完整版7.6M)
#  pod 'UMengUShare/Social/Sina'    #集成新浪微博(完整版25.3M)

#s.ios.dependency 'WechatOpenSDK' # 集成微信
#s.ios.dependency 'AlipaySDK-2.0' # 集成支付宝

end
