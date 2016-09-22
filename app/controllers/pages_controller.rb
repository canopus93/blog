class PagesController < ApplicationController
  def index
  	@blog_posts = BlogPost.all
  end

  def about
  end

  def sample_blog_post
  end
end
