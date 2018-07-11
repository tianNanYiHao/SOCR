Pod::Spec.new do |s|
  s.name = "SOCR"
  s.version = "0.1.0"
  s.summary = "\u{901a}\u{4ed8}\u{76fe}\u{6d3b}\u{4f53}\u{8bc6}\u{522b}SDK\u{4e8c}\u{6b21}\u{5c01}\u{88c5}"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"tianNanYiHao"=>"851085835@qq.com"}
  s.homepage = "https://github.com/tianNanYiHao/SOCR"
  s.description = "\u{63cf}\u{8ff0}\u{4fe1}\u{606f}:\u{8fd9}\u{662f}\u{4e00}\u{4e2a}\u{4e8c}\u{6b21}\u{5c01}\u{88c5}SDK\u{7684}lib,\u{5c06}\u{4f1a}\u{7528}\u{5230}\u{5f88}\u{591a}\u{8457}\u{540d}\u{7b2c}\u{4e09}\u{65b9}SDK,\u{8be5}\u{529f}\u{80fd}\u{7528}\u{4e8e}\u{6253}\u{5305}\u{5305}\u{542b}\u{8fd9}\u{4e9b}\u{8457}\u{540d}\u{7b2c}\u{4e09}\u{65b9}(\u{8be5}\u{63d2}\u{4ef6}\u{901a}\u{8fc7}\u{5bf9}\u{5f15}\u{7528}\u{7684}\u{4e09}\u{65b9}\u{5e93}\u{8fdb}\u{884c}\u{91cd}\u{547d}\u{540d}\u{5f88}\u{597d}\u{7684}\u{89e3}\u{51b3}\u{4e86}\u{7c7b}\u{5e93}\u{547d}\u{540d}\u{51b2}\u{7a81}\u{7684}\u{95ee}\u{9898}\u{3002}http://www.cnblogs.com/brycezhang/p/4117180.html)"
  s.frameworks = ["UIKit", "CoreMedia", "AVFoundation", "Foundation"]
  s.libraries = "stdc++"
  s.xcconfig = {"OTHER_LDFLAGS"=>"-ObjC"}
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/SOCR.embeddedframework/SOCR.framework'
end
