source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '16.2'

inhibit_all_warnings!
install! 'cocoapods', :disable_input_output_paths => true

def common_pods
    pod 'Alamofire', '~> 5.5.0'
    pod 'Nuke', '~> 10.0'
    pod 'GooglePlaces', '~> 8.1.0'
    pod 'GoogleMaps', '~> 8.2.0'
end

target 'Modulo2' do
	use_frameworks!
	common_pods
end
