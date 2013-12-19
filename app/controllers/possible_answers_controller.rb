class PossibleAnswersController < ApplicationController

	def index

		@questions = Question.where(user_id: current_user.id) 
	
	
	



		# q1= Question.find[:question_id]
		# @answers = q1.answers
		# @answers = current_user.questions.answers

        # @questions = Question.all
        # @insights = Insight.all
        # @answers = Answer.all
	end 


	def show 
		@questions = Question.where(user_id: current_user.id) 
		@vote = Vote.where(:question_id => @question.id, :user_id => current_user.id).count
	# @question = Question.find(@vote.question_id)
	
	


	

		#@answer = Answer.q1

		# @answer = Answer.find(params[:id])
		# @question = Question.find(@answer.question_id)



		# @yes_answers = Answer.where(question_id: @answer.question_id, body: 'YES').count
		# @no_answers = Answer.where(question_id: @answer.question_id, body: 'NO').count
		# @open_answers = Answer.where(question_id: @answer.question_id)

	end 




private 

def possible_answer_params
      params.require(:possible_answer).permit(:body, :question_id, :possible_answer_id)
    end

end
