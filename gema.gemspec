# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gema/version"

Gem::Specification.new do |spec|
  spec.name          = "gema"
  spec.version       = Gema::VERSION
  spec.authors       = ["SergioRavelo"]
  spec.email         = ["alu0100902341@ull.edu.es"]

  spec.summary       = %q{P10 LPP: Functional programming and benchmarks}
  spec.description   = %q{Functional programming, loops and benchmarks.}
  spec.homepage      = "https://github.com/alu0100902341/P10_LPP.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/alu0100902341/P10_LPP.git"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

	spec.add_development_dependency "guard"
	spec.add_development_dependency "guard-rspec"
	spec.add_development_dependency "guard-bundler"

	spec.add_development_dependency "coveralls"
end
