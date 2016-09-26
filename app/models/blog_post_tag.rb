class BlogPostTag < ApplicationRecord
  has_many :blog_post_tag_details
  has_many :blog_post, :through => :blog_post_tag_details
end
