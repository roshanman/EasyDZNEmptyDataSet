#
# Be sure to run `pod lib lint EasyDZNEmptyDataSet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyDZNEmptyDataSet'
  s.version          = '0.1.0'
  s.summary          = 'Easy warpper for DZNEmptyDataSet.'

  s.description      = <<-DESC
Easy warpper for DZNEmptyDataSet.
                       DESC

  s.homepage         = 'https://github.com/roshanman/EasyDZNEmptyDataSet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'morenotepad@163.com' => 'morenotepad@163.com' }
  s.source           = { :git => 'https://github.com/roshanman/EasyDZNEmptyDataSet.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'EasyDZNEmptyDataSet/Classes/**/*'

  s.dependency 'DZNEmptyDataSet'
  s.dependency 'Extra2'
end
