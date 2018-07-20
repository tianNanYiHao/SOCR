#
# Be sure to run `pod lib lint SOCR.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    # 名字要一致
    s.name             = 'SOCR'
    # 版本要和git的tag版本一致
    s.version          = '0.3.0'
    # 描述
    s.summary          = 'The SOCR include tfdSDK and Masonry'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
TODO:               SOCR.framework ,need tfdSDK and Masonry. It is a test Static lib for Learn.
                        DESC
    
    # 主页信息网址
    s.homepage         = 'https://github.com/tianNanYiHao/SOCR'
    # 截图地址
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    # 证书 一般用下面的格式 如果用了其他的格式 需要相应的修改
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    # 作者信息及邮箱
    s.author           = { 'tianNanYiHao' => '851085835@qq.com' }
    # spec配置文件的位置 (这里是绝对路径,文件位置变动需及时修改)
    s.source           = { :git => '/Users/tiannanyihao/Desktop/SOCR', :tag => s.version.to_s }
    # 媒体文件
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    # 工程依赖系统版本
    s.ios.deployment_target = '8.0'
    # 源文件 包含 h,m
    s.source_files = 'SOCR/Classes/**/*.{h,m}'
    # 资源文件 .png/.bundle等(多个)
    s.resource_bundles = {
    'SOCR' =>['SOCR/Assets/*.png','SOCR/Assets/com.baidu.idl.face.faceSDK.bundle','SOCR/Assets/com.baidu.idl.face.model.bundle','SOCR/Assets/CWResource.bundle']
    }
    # 公开头文件 打包只公开特定的头文件
    s.public_header_files = 'SOCR/Classes/head/SOCR.h'
    # 调试公开所有的头文件 这个地方下面的头文件 如果是在Example中调试 就公开全部，需要打包就只公开特定的h文件
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # 私有头文件
    # subcfiles.private_header_files = "MyLibrary/cfiles/**/*.h"
    # 是否是静态库 这个地方很重要 假如不写这句打出来的包 就是动态库 不能使用 一运行会报错 image not found
    s.static_framework  =  true
    # 载入第三方.a (如paynuc.a这种)
    #s.vendored_libraries = 'SOCR/Classes/openssl/include/*.{a}'
    # 载入第三方.a头文件
    #s.xcconfig = { 'USER_HEADER_SEARCH_PATHS' => 'SOCR/Classes/openssl/include/openssl/*.{h}' }
    # 链接设置 重要
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}

    # 第三方开源框架(多个)
    s.dependency 'Masonry'

    # 第三方非开源framework(多个)
    s.vendored_frameworks = ['SOCR/Classes/framework/IDLFaceSDK.framework','SOCR/Classes/framework/PayEgisFace.framework']

    # 系统动态库(多个)
    s.frameworks = 'UIKit','CoreMedia','AVFoundation','Foundation'
    
    # 系统类库(多个) 注意:系统类库不需要写全名 去掉开头的lib
    s.libraries = 'stdc++'
end
