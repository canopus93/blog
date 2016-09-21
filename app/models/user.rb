class User < ApplicationRecord
	has_many :blog_posts
	validates :name, presence: true,
					 length: { maximum: 45 }
	validates :email, presence: true,
					  length: { maximum: 45 },
					  format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
end
