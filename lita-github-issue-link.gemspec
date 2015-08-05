Gem::Specification.new do |spec|
  spec.name          = "lita-github-issue-link"
  spec.version       = "0.1.0"
  spec.authors       = ["Mike Vormwald"]
  spec.email         = ["mvormwald@gmail.com"]
  spec.description   = "Provides a link to github issues"
  spec.summary       = "Provides a link to github issues"
  spec.homepage      = "https://vormwald.github.io/lita-github-issue-link"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.4"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
