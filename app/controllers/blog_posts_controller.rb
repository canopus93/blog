class BlogPostsController < ApplicationController
	require 'csv'

	def index
		redirect_to root_path unless session[:user_id]
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
		redirect_to root_path unless session[:user_id]
		@blog_post = BlogPost.new
	end

	def upload
		redirect_to root_path unless session[:is_admin]
	end

	def import
		redirect_to root_path unless session[:is_admin]
		file_path = params[:file].path
		@rows = CSV.read(file_path)

		ActiveRecord::Base.transaction do
			@rows[1..-1].each do |row|
				@user = User.where(email: row[1]).take
				if(@user == nil)
					@user = User.new(
						name: row[0], 
						email: row[1], 
						password: 'default', 
						is_admin: false, 
						activity_count: 0
					)
					@user.save
				end
				@blog_post = BlogPost.new(title: row[2], summary: row[3], content: row[4], title_image_url: row[5], user: @user, view_count: 0)
				@blog_post.save
			end
		end

	    redirect_to root_path
	end

	def edit
		redirect_to root_path unless session[:user_id]
		@blog_post = BlogPost.find(params[:id])
		decorator = BlogPostsDecorator.new(self)
		@blog_post_tag = decorator.decorate_for_show(BlogPost.find(params[:id]))
	end

	def create
		redirect_to root_path unless session[:user_id]
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
		redirect_to root_path unless session[:user_id]
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
		redirect_to root_path unless session[:user_id]
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
