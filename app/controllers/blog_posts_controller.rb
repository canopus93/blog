class BlogPostsController < ApplicationController
	def index
		decorator = BlogPostsDecorator.new(self)
		@blog_posts = decorator.decorate_for_index(BlogPost.order(created_at: :ASC))
	end

	def show
		@blog = BlogPost.find(params[:id])
		@blog.view_count = @blog.view_count + 1
		@blog.update_attribute(:view_count, @blog.view_count)

		decorator = BlogPostsDecorator.new(self)
		@blog_post = decorator.decorate_for_show(BlogPost.find(params[:id]))
	end

	def new
		@blog_post = BlogPost.new
	end

	def edit
		@blog_post = BlogPost.find(params[:id])
		decorator = BlogPostsDecorator.new(self)
		@blog_post_tag = decorator.decorate_for_show(BlogPost.find(params[:id]))
	end

	def create
		@blog_post = BlogPost.new(blog_post_params)

		if @blog_post.valid?
			ActiveRecord::Base.transaction do
				@blog_post.save
				save_tag(id_blog_post: @blog_post.id, save_type: 'new')
			end
				#raise 'a'
			redirect_to @blog_post
		else
			render 'new'
		end
	end

	def update
		@blog_post = BlogPost.find(params[:id])

		if @blog_post.valid?
			ActiveRecord::Base.transaction do
				@blog_post.update(blog_post_params)
				save_tag(id_blog_post: params[:id], save_type: 'update')
			end
			redirect_to @blog_post
		else
			render 'edit'
		end
	end

	def destroy
		@blog_post = BlogPost.find(params[:id])
		@blog_post.destroy

		redirect_to blog_posts_path
	end

	private
		def blog_post_params
			params.require(:blog_post).permit(:title, :summary, :content, :title_image_url, :user_id, :view_count)
		end

		def save_tag(id_blog_post:, save_type:)
			if(save_type == 'update')
				@blog_post_tag_to_delete = BlogPostTag.where(blog_post_id: id_blog_post)
				
				@blog_post_tag_to_delete.each do |tag_detail|
					tag_detail.destroy
				end
			end
			@tag_params = params[:tag].split(' ')
			@tag_params.each do |tag_param|
				@tag = Tag.where(name: tag_param).take
				if(@tag == nil)
					@tag = Tag.new(name: tag_param)
					# @tag.name = tag_param
					@tag.save
				end

				# @blog_post_tag = BlogPostTag.new
				# @blog_post_tag.blog_post = BlogPost.find(id_blog_post)
				# @blog_post_tag.tag = @tag
				# @blog_post_tag.save

				blog_post = BlogPost.find(id_blog_post)
				BlogPostTag.new(blog_post: blog_post, tag: @tag)
						   .save
			end 
		end
end
