namespace :blog_post do
  desc "TODO"
  task :import_csv => :environment do  	
  	# BLOG_POST_CSV_PATH
  	# /home/saxophone/Documents/blog_post.csv
  	if ENV['BLOG_POST_CSV_PATH']
  		require 'csv'
  		rows = CSV.read(ENV['BLOG_POST_CSV_PATH'])

			ActiveRecord::Base.transaction do
				rows[1..-1].each do |row|
					user = User.where(email: row[1]).take
					if(user == nil)
						user = User.new(
							name: row[0], 
							email: row[1], 
							password: 'default', 
							is_admin: false, 
							activity_count: 0
						)
						user.save!
					end
					blog_post = BlogPost.new(
						title: row[2], 
						summary: row[3], 
						content: row[4], 
						title_image_url: row[5], 
						user: user, 
						view_count: 0
					)
					blog_post.save!
				end
			end
  	else
  		puts 'Please specify CSV PATH'
  	end
  end
end