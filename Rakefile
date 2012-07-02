require 'rake/testtask'
require 'rdoc/task'

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = false
  t.warning = true
end

RDoc::Task.new do |rdoc|
  rdoc.main = "README.rdoc"
  rdoc.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  rdoc.rdoc_dir = "doc"
end

task :default => 'test'
