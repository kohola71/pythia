
class InsightsController < ApplicationController

	def index 
		@insight = Insight.all 
		@question = Question.find(params[:question_id])
	end 

	def create
		@insight = Insight.new(insight_params)
		@insight.save
		redirect_to question_path(@insight.question)
	end 


	# def show 
	# 	@insight = Insight.find(params[:id])
	# 	@question = Question.find(@insight.question_id)
		
	# end 
	
private 

def insight_params
      params.require(:insight).permit(:body, :kind, :question_id)
    end


end 

