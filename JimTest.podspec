#
#  Be sure to run `pod spec lint JimTest.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "JimTest"
  s.version      = "0.0.1"
  s.summary      = "open source Test With JimTest."


  s.homepage     = "https://github.com/QA411/JimTest.git"
  s.license      = 'MIT'
  s.author             = { "Dely" => "912992586@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/QA411/JimTest.git", :tag => s.version }
  s.source_files  = "JimTest/*.{h,m}"
  s.resources = "*.jpg", "*.md", "*.mobileprovision"
  s.frameworks  = "UIKit", "Foundation"

end
