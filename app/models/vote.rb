class Vote < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :possible_answer
end