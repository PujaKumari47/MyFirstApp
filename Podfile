platform :ios, '9.0'
 use_frameworks!

target 'NewProject' do
pod 'Alamofire', '~> 4.4'
pod 'Google/Analytics'
pod 'ObjectMapper'
pod 'Crashlytics'
pod 'Mixpanel-swift'
end
post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3'
end
end
end
