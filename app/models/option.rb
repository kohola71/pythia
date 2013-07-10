class Option < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :decision
end
