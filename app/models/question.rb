class Question < ActiveRecord::Base
	has_many :answers, :dependent => :destroy
	validates :text, presence: true, length: {minimum: 5}
end
