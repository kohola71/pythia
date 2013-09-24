# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :answers
  has_many :questions
end


