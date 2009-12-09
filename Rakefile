if $0 =~ /macrake$/

  require 'hotcocoa/application_builder'
  require 'hotcocoa/standard_rake_tasks'

  task :default => [:run]

else
  
  require 'rake/testtask'

  namespace :test do
    
    Rake::TestTask.new(:units) do |t|
      t.libs << 'test/units'
      t.test_files = FileList['test/units/*test.rb']
      t.verbose = true
    end
  
    Rake::TestTask.new(:acceptance) do |t|
      t.libs << 'test/acceptance'
      t.test_files = FileList['test/acceptance/test_suite.rb']
      t.verbose = true
    end
  
  end
  
  task :default => ['test:units', 'test:acceptance']
  
end