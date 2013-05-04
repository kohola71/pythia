class DecisionsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@decisions = Decision.all
	end


	def show
		@decision = Decision.find params[:id]
	end


	def new
		@decision = Decision.new
	end


	def create
		@decision = Decision.new params[:decision]
		@decision.user = current_user
		@decision.save
		redirect_to :decisions

	end


	def edit
		@decision = Decision.find params[:id]
	end

	def update 
		@decision = Decision.find params[:id]
		if @decision.update_attributes params[:decision]
			redirect_to @decision
		else
			render :action => "edit"
		end
	end

	def destroy
		@decision = Decision.find params[ :id]
		@decision.destroy
		redirect_to :decisions
	end


	
end
