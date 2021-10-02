require "bundler/gem_tasks"
require "rake/testtask"



Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :doc do
  sh "bundle exec yardoc 'lib/**/*.rb' -o ./docs"
end

task :default => :test
