class User < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :answers
  has_many :questions
end


