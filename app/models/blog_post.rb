class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :blog_post_tag, dependent: :destroy
  has_many :tag, through: :blog_post_tag

  validates :title, presence: true,
					 length: { maximum: 45 }
  validates :summary, length: { maximum: 150 }
  validates :content, presence: true
  validates :title_image_url, length: { maximum: 150 }
end
