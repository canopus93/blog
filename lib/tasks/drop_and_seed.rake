# namespace :my_namespace do
#   desc "TODO"
  task :drop_and_seed => :environment do
  	Rake::Task['db:drop'].invoke
  	Rake::Task['db:create'].invoke
  	Rake::Task['db:migrate'].invoke
  	Rake::Task['db:seed'].invoke
  end

  task :aaa => :environment do
  	require 'pry'
  	binding.pry
  	test = 'a'
  end

#   desc "TODO"
#   task :my_task2 => :environment do
#   end
# end
