
class InsightsController < ApplicationController
	def create
		@insight = Insight.new(insight_params)
		@insight.save
		redirect_to question_path(@insight.question)
	end 

private 

def insight_params
      params.require(:insight).permit(:body, :kind, :question_id)
    end


end 
