class QuestionsController < ApplicationController

	def index
        @questions = Question.where(user_id: current_user.id) 
        #@questions = current_user.questions
        @answers = Answer.all
        @insights = Insight.all
	end 

	def new
		@question = Question.new
		@friends = current_user.friends
		
	end

	def create 
		@question = Question.new(params[:question].permit(:title, :text))
		@question.user = current_user

		if @question.save
			redirect_to @question
		else 
			render 'new'
		end 

	end 

	def show 
		@question = Question.find(params[:id])
		@insight = Insight.new
		@insights = @question.insights
		@answer = Answer.new
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
      params.require(:question).permit(:body, :question)
    end


end 



