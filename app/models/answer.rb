# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :text
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
	belongs_to :question
	has_many :insights, :dependent => :destroy
	scope :possible_answers
	

end
