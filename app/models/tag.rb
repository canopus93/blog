class Tag < ApplicationRecord
  has_many :blog_post_tag
  has_many :blog_post, through: :blog_post_tag
end
