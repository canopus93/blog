class PagesController < ApplicationController
  def index
  	decorator = BlogPostsDecorator.new(self)
		@blog_posts = decorator.decorate_for_index(BlogPost.order('created_at ASC'))
  end

  def dashboard
    blog_decorator = BlogPostsDecorator.new(self)
    @blog_post = blog_decorator.decorate_for_show(BlogPost.order('view_count DESC').first)
    user_decorator = UsersDecorator.new(self)
    @user = user_decorator.decorate_for_show(User.order('activity_count DESC').first)
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
