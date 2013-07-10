class Decision < ActiveRecord::Base
	validates_presence_of :question, :message => ": fill it up dumbass!"
  	attr_accessible :question, :description 
  	belongs_to :user
  	has_many :options
end
