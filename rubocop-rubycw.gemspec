require_relative 'lib/rubocop/rubycw/version'

Gem::Specification.new do |spec|
  spec.name          = "rubocop-rubycw"
  spec.version       = RuboCop::Rubycw::VERSION
  spec.authors       = ["Masataka Pocke Kuwabara"]
  spec.email         = ["kuwabara@pocke.me"]

  spec.summary       = %q{Integrate RuboCop and ruby -cw}
  spec.description   = %q{Integrate RuboCop and ruby -cw}
  spec.homepage      = "https://github.com/rubocop/rubocop-rubycw"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")
  spec.license       = 'MIT'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["default_lint_roller_plugin"] = 'RuboCop::Rubycw::Plugin'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'lint_roller', '~> 1.1'
  spec.add_runtime_dependency 'rubocop', '~> 1.72', '>= 1.72.1'
end
