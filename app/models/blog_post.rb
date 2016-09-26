class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :blog_post_tag_details
  has_many :blog_post_tag, :through => :blog_post_tag_details

  validates :title, presence: true,
					 length: { maximum: 45 }
  validates :summary, length: { maximum: 150 }
  validates :content, presence: true
  validates :title_image_url, length: { maximum: 150 }

  def self.search(search)
  	where("title LIKE ? OR summary LIKE ? OR tag LIKE?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
