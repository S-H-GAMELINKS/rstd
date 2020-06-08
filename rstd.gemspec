require_relative 'lib/rstd/version'

Gem::Specification.new do |spec|
  spec.name          = "rstd"
  spec.version       = Rstd::VERSION
  spec.authors       = ["S-H-GAMELINKS"]
  spec.email         = ["gamelinks007@gmail.com"]

  spec.summary       = %q{ useful implementation for ruby }
  spec.description   = %q{ useful implementation for ruby }
  spec.homepage      = "https://github.com/S-H-GAMELINKS/rstd"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/S-H-GAMELINKS/rstd"
  spec.metadata["changelog_uri"] = "https://github.com/S-H-GAMELINKS/rstd"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
