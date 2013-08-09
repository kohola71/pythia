class QuestionsController < ApplicationController

	def index
        @questions = Question.all 
        @answers = Answer.all
	end 

	def new
		@question = Question.new
		
	end

	def create 
		@question = Question.new(params[:question].permit(:title, :text))
		# @question.user = current_user

		if @question.save
			redirect_to @question
		else 
			render 'new'
		end 

	end 

	def show 
		@question = Question.find(params[:id])
	end 


	def edit
		@question = Question.find params[:id]
	end

	def destroy 
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to questions_path
	end 


end 



