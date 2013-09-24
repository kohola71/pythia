# == Schema Information
#
# Table name: insights
#
#  id          :integer          not null, primary key
#  body        :text
#  kind        :string(255)
#  question_id :integer
#

class Insight < ActiveRecord::Base
	belongs_to :question
	belongs_to :answer
	
end
