class BlogPostDecorator

	def decorate_for_index(blog_posts)
		results = []
		blog_posts.each do |blog_post|
			results << {
				user_id: blog_post.user_id,
				user_name: User.find(blog_post.user_id).name,
				blog_post_id: blog_post.id,
				title: blog_post.title,
				summary: blog_post.summary,
				content: blog_post.content,
				title_image_url: blog_post.title_image_url,
				created_at: blog_post.created_at.strftime("%B %d, %Y"),
				updated_at: blog_post.updated_at.strftime("%B %d, %Y")
			}
		end
		results
	end

	def decorate_for_show(blog_post)
		raise 'a'
	end


	def abc(a, b)
	end

end