$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "span/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "span"
  s.version     = Span::VERSION
  s.authors     = ["Lim9"]
  s.email       = ["talktous@Lim9.com"]
  s.homepage    = "https://limbo.lim9.com"
  s.summary     = "Summary of Limbo."
  s.description = "Description of Limbo."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.2", "< 5.0"
  s.add_dependency "haml", ">= 4.0", "< 5.0"
  s.add_dependency "haml-rails", ">= 0.9", "< 1.0"
  s.add_dependency "browser", ">= 1.0", "< 2.0"
  s.add_dependency "carrierwave", ">= 0.0", "< 1.0"
  s.add_dependency "mini_magick", ">= 4.0", "< 5.0"
  s.add_dependency "draper", ">= 2.0", "< 3.0"
  s.add_dependency "redcarpet", ">= 3.0", "< 4.0"
  s.add_dependency "jquery-ui-rails", ">= 5.0", "< 6.0"
  s.add_dependency "jquery-turbolinks", ">= 2.0", "< 3.0"
  s.add_dependency "will_paginate", ">= 3.0", "< 4.0"
  s.add_dependency "email_validator", ">= 1.0", "< 2.0"
end
