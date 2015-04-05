require 'rake'
require 'rspec'

task :default => :test

task :test do
  test_files = Rake::FileList['spec/*/*.rb']
  RSpec::Core::Runner.run(test_files)
end