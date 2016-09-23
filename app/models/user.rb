class User < ApplicationRecord
	has_many :blog_posts
	validates :name, presence: true,
					 length: { maximum: 45 }
	validates :email, presence: true,
					  length: { maximum: 45 },
					  uniqueness: { case_sensitive: false },
					  format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
	validates :password, presence: true,
					  length: { maximum: 45 }
end
