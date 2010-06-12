require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name              = "shoppr"
    gem.summary           = %Q{Ruby wrapper for the Shopping.com API}
    gem.email             = "jim@squeejee.com"
    gem.homepage          = "http://github.com/squeejee/shoppr"
    gem.authors           = ["Wynn Netherland", "Jim Mulholland"]
    gem.rubyforge_project = "shoppr"
    gem.files             = FileList["[A-Z]*", "{examples,lib,test}/**/*"]
    
    gem.add_dependency('hashie', '0.2.0')
    gem.add_dependency('httparty', '>= 0.5.0')
    
    gem.add_development_dependency('thoughtbot-shoulda')
    gem.add_development_dependency('jeremymcanally-matchy')
    gem.add_development_dependency('mocha')
    gem.add_development_dependency('fakeweb')
    gem.add_development_dependency('hashie')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "shoppr #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'rake/contrib/sshpublisher'
  namespace :rubyforge do
    
    desc "Release gem and RDoc documentation to RubyForge"
    task :release => ["rubyforge:release:gem"]
    
  end
rescue LoadError
  puts "Rake SshDirPublisher is unavailable or your rubyforge environment is not configured."
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r shoppr.rb"
end
