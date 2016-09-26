class BlogPostTagDetail < ApplicationRecord
  belongs_to :blog_post
  belongs_to :blog_post_tag
end
