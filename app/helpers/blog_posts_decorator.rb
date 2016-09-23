class BlogPostsDecorator
	# include ApplicationHelper
	include Rails.application.routes.url_helpers
	include ActionView::Helpers::UrlHelper
	#include ActionView::Helpers::TagHelper

	def initialize(controller_context)
		@controller_context = controller_context
	end

	BlogPostsDecoratorResult = Struct.new(
		:user_id,
		:user_name,
		:id,
		:title,
		:summary,
		:content,
		:title_image_url,
		:created_at,
		:updated_at,
		:link_to_edit,
		:link_to_delete,
		:link_to_show,
		:link_to_user
	)

	def decorate_for_index(blog_posts)
		results = []
		users = User.all
		blog_posts.each do |blog_post|
			user_name = users.select{|user| user.id == blog_post.user_id}.first.name
			results << generate_decorator_result(blog_post: blog_post, user_name: user_name)
		end
		results
	end

	def decorate_for_show(blog_post)
		user_name = User.find(blog_post.user_id).name
		
		generate_decorator_result(blog_post: blog_post, user_name: user_name)
	end

	private

	def generate_decorator_result(blog_post:, user_name:)
		result = BlogPostsDecoratorResult.new
		result.id = blog_post.id
		result.title = blog_post.title
		result.summary = blog_post.summary
		result.content = blog_post.content
		result.title_image_url = blog_post.title_image_url
		result.created_at = date_time_formated(blog_post.created_at)
		result.updated_at = date_time_formated(blog_post.updated_at)
		result.user_id = blog_post.user_id
		result.user_name = user_name
		result.link_to_edit = link_to_edit(blog_post)
		result.link_to_delete = link_to_delete(blog_post)
        result.link_to_show = link_to_show(blog_post)
    	result.link_to_user = link_to_user(result)

    	result
	end

	def link_to_index
		@controller_context.helpers.link_to 'Back', blog_posts_path
	end

	def link_to_user(result)
		@controller_context.helpers.link_to result.user_name, "#"
	end

	def link_to_show(blog_post)
		@controller_context.helpers.link_to blog_post_path(blog_post.id) do
			content_tag(:h2, blog_post.title, class: 'post-title') +
			content_tag(:h3, blog_post.summary, class: 'post-subtitle')
		end
	end

	def link_to_edit(blog_post)
		@controller_context.helpers.link_to 'Edit', edit_blog_post_path(blog_post.id)
	end

	def link_to_delete(blog_post)
		@controller_context.helpers.link_to 'Delete', blog_post_path(blog_post.id),
			method: :delete,
			data: { confirm: 'Are you sure to delete ' + blog_post.title + '?' }
	end

	def date_time_formated(datetime)
		datetime.strftime("%B %d, %Y")
	end

end

