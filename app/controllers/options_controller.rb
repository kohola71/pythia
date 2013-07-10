class OptionsController < ApplicationController
before_filter :authenticate_user!


def index 
	@options = Option.all
end 




end
