# SOCR

[![CI Status](https://img.shields.io/travis/tianNanYiHao/SOCR.svg?style=flat)](https://travis-ci.org/tianNanYiHao/SOCR)
[![Version](https://img.shields.io/cocoapods/v/SOCR.svg?style=flat)](https://cocoapods.org/pods/SOCR)
[![License](https://img.shields.io/cocoapods/l/SOCR.svg?style=flat)](https://cocoapods.org/pods/SOCR)
[![Platform](https://img.shields.io/cocoapods/p/SOCR.svg?style=flat)](https://cocoapods.org/pods/SOCR)

## Example

这是测试工程文件, 当SOCR.podspec配置文件有过改动(有可能新增了什么第三方.a文件/第三方.framework静态库/.bundle/.png等文件的路径等),请在Example文件目录下 ```pod install```,完成Example工程文件的更新配置,用于后期编译打包出我们所需的.a/.framework静态库

## Requirements

## Installation

SOCR is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SOCR'
```

## 参考链接
>[使用CocoaPods开发并打包静态库](http://www.cnblogs.com/brycezhang/p/4117180.html)

>[cocoaPods 进行SDK二次包装(cocoapods-packager完成 framework静态库打包,避免第三方库冲突)](https://blog.csdn.net/iOSTianNan/article/details/81007691)

## .podspec文件配置信息如下
```
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
    s.version          = '0.2.0'
    # 描述
    s.summary          = '活体识别SDK二次封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
    描述信息:这是一个二次封装SDK的lib,将会用到很多著名第三方SDK,该功能用于打包包含这些著名第三方(该插件通过对引用的三方库进行重命名很好的解决了类库命名冲突的问题。http://www.cnblogs.com/brycezhang/p/4117180.html)
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
    # 'SOCR/Assets/*.png',
    s.resource_bundles = {
    'SOCR' =>[
    'SOCR/Assets/com.baidu.idl.face.faceSDK.bundle',
    'SOCR/Assets/com.baidu.idl.face.model.bundle',
    'SOCR/Assets/CWResource.bundle'
    ]
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
    s.vendored_frameworks = [
    'SOCR/Classes/framework/IDLFaceSDK.framework',
    'SOCR/Classes/framework/PayEgisFace.framework'
    ]
    # 系统动态库(多个)
    s.frameworks = 'UIKit','CoreMedia','AVFoundation','Foundation'
    # 系统类库(多个) 注意:系统类库不需要写全名 去掉开头的lib
    s.libraries = 'stdc++'
end

```

## Tip
###几个会用到的命令记录
1.创建cocoapods开发静态库(Static Library)的命令
> pod lib create SOCR 

2.修改SOCR.podspec配置文件后,进入Example进行更新
> pod install

3.提交源码以及git打好和SOCR.podspec配置文件中版本一致的tag
> git add -A

> git commit -m '版本0.1.0' -a

> git tag -a 0.1.0 -m '版本0.1.0'

4.编译打包.a/.framework静态库
>4.1 .a 用这个

>pod package xxx.podspec --library --force

>4.2 .framework 用这个

>pod package xxx.podspec --force --no-mangle -embedded

## Author

tianNanYiHao, 851085835@qq.com

## License

SOCR is available under the MIT license. See the LICENSE file for more info.

## 以上
**写了这些,仅仅是作为自己的一个记录,以便于后期再用的时候翻阅查看,有些地方并未讲的太详细.因为仅仅是供自己翻阅使用**


## 补充
打出的.framework添加到项目工程中去的时候, 还是报错了: 打出的静态库SOCR.framework中使用了Masonry, 项目工程中也使用了Masonry.
报错在于两个库还是冲突了,这显然不符合预期,
>解决方案:在项目工程中,other link 里面存在Masonry的相对路径
>将项目中的 other link 保留 -ObjC,其他的删除即可
>如图
>


/Users/tiannanyihao/Desktop/WechatIMG317.jpeg


