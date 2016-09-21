class BlogPostsController < ApplicationController
	def index
		@blog_posts = Blog_post.all
	end

	def show
		@blog_post = Blog_post.find(params[:id])
	end

	def new
		@blog_post = Blog_post.new
	end

	def edit
		@blog_post = Blog_post.find(params[:id])
	end

	def create
		@blog_post = Blog_post.new(blog_post_params)

		if @blog_post.save
			redirect_to @blog_post
		else
			render 'new'
		end
	end

	def update
		@blog_post = Blog_post.find(params[:id])

		if @blog_post.update(blog_post_params)
			redirect_to @blog_post
		else
			render 'edit'
		end
	end

	def destroy
		@blog_post = Blog_post.find(params[:id])
		@blog_post.destroy

		redirect_to blog_posts_path
	end

	private
		def blog_post_params
			params.require(:blog_post).permit(:title, :summary, :content, :title_image_url, :user_id)
		end
end
