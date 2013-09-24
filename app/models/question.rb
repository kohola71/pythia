# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
	has_many :answers, :dependent => :destroy
	validates :text, presence: true, length: {minimum: 5}
	has_many :insights, :dependent => :destroy


def number_of_yes_answers
    answers.where(body: 'YES').count
end 

def number_of_no_answers
	answers.where(body: 'NO').count
end

end 
