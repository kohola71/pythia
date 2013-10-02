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
	scope :no_answers, where(body: 'NO')
	scope :yes_answers, where(body: 'YES')
	scope :open_answers

end
