if $0 =~ /macrake$/

  require 'hotcocoa/application_builder'
  require 'hotcocoa/standard_rake_tasks'

  task :default => [:run]

else
  
  require 'rake/testtask'

  namespace :test do
    
    Rake::TestTask.new(:acceptance) do |t|
      t.libs << 'test/acceptance'
      t.test_files = FileList['test/acceptance/*test.rb']
      t.verbose = true
    end
  
  end
  
  task :default => ['test:acceptance']
  
end