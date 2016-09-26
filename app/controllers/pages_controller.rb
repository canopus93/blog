class PagesController < ApplicationController
  def index
  	decorator = BlogPostsDecorator.new(self)
		@blog_posts = decorator.decorate_for_index(BlogPost.all)
  end

  def about
  end

  def recent_blog
  	decorator = BlogPostsDecorator.new(self)
	  	@blog_posts = decorator.decorate_for_index(BlogPost.search(params[:q]))
  end

  def sample_blog_post
  end
end
