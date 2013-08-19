class AnswersController < ApplicationController

	def create 
	# @question = Question.find(params[:answer][:question_id])	
		@answer = Answer.new(answer_params)
		@answer.save
		redirect_to answer_path(@answer)
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
