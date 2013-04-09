class Decision < ActiveRecord::Base
  attr_accessible :question, :description, :option1_name, :option2_name
end
