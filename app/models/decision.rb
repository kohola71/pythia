class Decision < ActiveRecord::Base
	validates_presence_of :question, :option1_name, :option2_name, :message => ": fill it up dumbass!"
  	attr_accessible :question, :description, :option1_name, :option2_name
end
