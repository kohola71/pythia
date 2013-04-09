class DecisionsController < ApplicationController
	def index
		@decisions = Decision.all
	end

def new
	@decision = Decision.new
end

def create
	@decision = Decision.new params[:decision]
	@decision.save
	redirect_to :decisions
end

	def show
		@decision = Decision.find params[:id]
	end

end
