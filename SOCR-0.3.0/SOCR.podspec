Pod::Spec.new do |s|
  s.name = "SOCR"
  s.version = "0.3.0"
  s.summary = "The SOCR include tfdSDK and Masonry"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"tianNanYiHao"=>"851085835@qq.com"}
  s.homepage = "https://github.com/tianNanYiHao/SOCR"
  s.description = "TODO:               SOCR.framework ,need tfdSDK and Masonry. It is a test Static lib for Learn."
  s.frameworks = ["UIKit", "CoreMedia", "AVFoundation", "Foundation"]
  s.libraries = "stdc++"
  s.xcconfig = {"OTHER_LDFLAGS"=>"-ObjC"}
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/SOCR.embeddedframework/SOCR.framework'
end
