class QuestionsController < ApplicationController

	def index
        @questions = Question.where(user_id: current_user.id)
        #@questions = current_user.questions
        @answers = Answer.all
        @insights = Insight.all
        @possible_answers = current_user.possible_answers
	end

	def new
		@question = Question.new
		# @possible_answer = PossibleAnswer.new
		3.times do
	    	@question.possible_answers.build
	    end

		@friends = current_user.friends

	end

	def create
		@question = Question.new(question_params)
		@question.user = current_user
		# @possible_answer = PossibleAnswer.new(params[:possible_answer].permit(:body))
		# @possible_answer.user = current_user

		if @question.save
			redirect_to @question
		else
			@friends = current_user.friends
			render 'new'
		end

	end

	def show
		@question = Question.find(params[:id])
		@possible_answer = PossibleAnswer.new
		@possible_answers = @question.possible_answers
	end

 def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to questions_path
	end

  private

  def question_params
    params.require(:question).permit(:body, :text, :question, :possible_answers_attributes => [:id, :body])
  end
end



