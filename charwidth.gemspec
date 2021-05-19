lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "charwidth/version"

Gem::Specification.new do |spec|
  spec.name          = "charwidth"
  spec.version       = Charwidth::VERSION
  spec.authors       = ["labocho"]
  spec.email         = ["labocho@penguinlab.jp"]
  spec.description   = "Normalize Japanese / Korean fullwidth (zenkaku) and halfwidth (hankaku) characters"
  spec.summary       = "Normalize Japanese / Korean fullwidth (zenkaku) and halfwidth (hankaku) characters"
  spec.homepage      = "https://github.com/labocho/charwidth"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r(^bin/)) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4.0"
end
