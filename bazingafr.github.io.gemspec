# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "bazingafr.github.io"
  spec.version       = "0.1.0"
  spec.authors       = ["Jubyaed Hossain"]
  spec.email         = ["hmjubayed@gmail.com"]

  spec.summary       = %q{made by jubayed: Write a short summary, because Rubygems requires one.}
  spec.homepage      = "https://bazingafr.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.6"
  spec.add_runtime_dependency "jekyll-paginate"
  spec.add_runtime_dependency "jekyll-seo-tag"
  spec.add_runtime_dependency "jekyll-sitemap"
  spec.add_runtime_dependency "jekyll-github-metadata"
  spec.add_runtime_dependency "jekyll-tagging"
  spec.add_runtime_dependency "jekyll-archives"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
