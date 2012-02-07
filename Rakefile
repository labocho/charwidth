# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require "#{File.dirname(__FILE__)}/lib/charwidth_normalization/version"
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "charwidth_normalization"
  gem.version = CharwidthNormalization::Version::STRING
  gem.homepage = "http://github.com/labocho/charwidth_normalization"
  gem.license = "MIT"
  gem.summary = %Q{Normalize Japanese/Korean FULL-WIDTH and HALF-WIDTH charcters}
  gem.description = %Q{Normalize Japanese/Korean FULL-WIDTH and HALF-WIDTH charcters}
  gem.email = "labocho@penguinlab.jp"
  gem.authors = ["labocho"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "charwidth_normalization #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
