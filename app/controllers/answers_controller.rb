class AnswersController < ApplicationController

	def index
        @answers = Answer.all 
        @question = Question.all
	end 


	def create 
	# @question = Question.find(params[:answer][:question_id])	
		@answer = Answer.new(answer_params)
		@answer.save
		redirect_to question_answer_path(@answer.question, @answer)
	end 


	def show
		@answer = Answer.find(params[:id])
		@question = Question.find(@answer.question_id)

		@yes_answers = Answer.where(question_id: @answer.question_id, body: 'YES').count
		@no_answers = Answer.where(question_id: @answer.question_id, body: 'NO').count

	end 


	def destroy
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:id])
		@answer.destroy
		redirect_to question_path(@question)
	end

private 

def answer_params
      params.require(:answer).permit(:body, :question_id)
    end

end
