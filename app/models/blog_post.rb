class BlogPost < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
					 length: { maximum: 45 }
  validates :summary, length: { maximum: 150 }
  validates :content, presence: true
  validates :title_image_url, length: { maximum: 150 }
end
