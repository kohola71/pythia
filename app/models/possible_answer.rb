class PossibleAnswer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
    has_many :insights
    belongs_to :answer
	validates :body, presence: true
	has_many :votes
end
