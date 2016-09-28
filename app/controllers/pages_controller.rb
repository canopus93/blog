class PagesController < ApplicationController
  def index
  	decorator = BlogPostsDecorator.new(self)
		@blog_posts = decorator.decorate_for_index(BlogPost.order(created_at: :ASC))
  end

  def dashboard
    blog_decorator = BlogPostsDecorator.new(self)
    @blog_posts = blog_decorator.decorate_for_index(BlogPost.order(view_count: :DESC).limit(5))
    @tags = blog_decorator.decorate_most_used_tag
    user_decorator = UsersDecorator.new(self)
    @users = user_decorator.decorate_for_index(User.order(activity_count: :DESC).limit(5))
  end

  def about
  end

  def recent_blog
    @search = BlogPost.search { keywords(params[:q]) }
  	decorator = BlogPostsDecorator.new(self)
    @blog_posts = decorator.decorate_for_index(@search.results)

    # @blog_posts = decorator.decorate_for_index(
    #    BlogPost.joins(blog_post_tag: :tag)
    #            .where("blog_posts.title LIKE ? OR blog_posts.summary LIKE ? OR tags.name LIKE ?", 
    #                   "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}")
    #            .distinct
    #  )
  end

  def sample_blog_post
  end
end
