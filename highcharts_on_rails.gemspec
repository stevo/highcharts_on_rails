$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "highcharts_on_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "highcharts_on_rails"
  s.version     = HighchartsOnRails::VERSION
  s.authors     = ["stevo"]
  s.email       = ["b.kosmowski@selleo.com"]
  s.homepage    = "https://github.com/stevo/highcharts_on_rails"
  s.summary     = "Highcharts on steroids"
  s.description = "Create highcharts in rails with ease!"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.12", "< 5.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
