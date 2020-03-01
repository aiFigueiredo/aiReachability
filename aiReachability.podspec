Pod::Spec.new do |s|
  s.name         = "aiReachability"
  s.version      = "1.0.0"
  s.summary      = "aiReachability is an iOS micro framework for gathering network state for cellular and wi-fi connections."
  s.description  = <<-DESC
  aiReachability is an iOS micro framework for gathering network state for cellular and wi-fi connections.
  This framework is a wrapper around the NWPathMonitor class and aims to be a simple example on how to gather network state, using native APIs.
  DESC
  s.author                  = "Jose Figueiredo"
  s.social_media_url        = "http://twitter.com/zemiguelfig"
  s.homepage                = "http://github.com/aiFigueiredo/aiReachability"
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.source_files            = "aiReachability/aiReachability/**/*"
  s.exclude_files           = "aiReachability/aiReachability/*.plist"
  s.ios.deployment_target   = "12.0"
  s.swift_version           = "5.1"
  s.platform                = :ios, "12.0"
  s.source                  = { :git => "https://github.com/aiFigueiredo/aiReachability.git", :tag => s.version.to_s }
end