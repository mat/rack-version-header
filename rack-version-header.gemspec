# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |gem|
  gem.name        = "rack-version-header"
  gem.version     = "0.1.1"
  gem.date        = Time.now.to_s
  gem.platform    = Gem::Platform::RUBY

  gem.summary     = "Rack middleware for adding a version response header."
  gem.description = "Adds an X-Version header to each response set to an arbitrary version string read from a file."

  gem.authors     = ["Matthias Luedtke"]
  gem.email       = ["email@matthias-luedtke.de"]
  gem.homepage    = "http://github.com/mat/rack-version-header"

  gem.rubyforge_project = "rack-version-header"

  gem.files = %w(lib/rack/version_header.rb README.md)
  gem.require_path = 'lib'
end

