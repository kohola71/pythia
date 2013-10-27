class PossibleAnswer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
  has_many :insights
	validates :body, presence: true
end
