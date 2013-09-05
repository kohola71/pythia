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
		@insight = Insight.new
		@insights = @question.insights
		@answer = Answer.new
	end 


	def edit
		@question = Question.find params[:id]
	end


 def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:answer])
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


end 



