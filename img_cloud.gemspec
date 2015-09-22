# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'img_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = "img_cloud"
  spec.version       = ImgCloud::VERSION
  spec.authors       = ["Rahul Singh"]
  spec.email         = ["flytorahul00@gmail.com"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.summary       = %q{ruby gem for img cloud, upload/transform images}
  spec.description   = %q{ruby gem for img cloud, upload/transform images}
  spec.homepage      = "https://github.com/img-cloud/ruby_gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.2'

  spec.add_runtime_dependency 'multipart-post', '~> 2.0', '>= 2.0.0'
  spec.add_development_dependency "actionpack", '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'travis', '~> 1.8', '>= 1.8.0'
end
