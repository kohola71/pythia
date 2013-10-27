
class InsightsController < ApplicationController

	def index
		@insight = Insight.all
		@question = Question.find(params[:question_id])
	end

	def create
    @possible_answer = PossibleAnswer.find(params[:possible_answer_id])
		@insight = Insight.new(insight_params.merge(question_id: @possible_answer.question_id))
		@insight.save
		redirect_to question_path(@insight.question)
	end

	# def show
	# 	@insight = Insight.find(params[:id])
	# 	@question = Question.find(@insight.question_id)

	# end

  private

  def insight_params
    params.require(:insight).permit(:body, :kind, :possible_answer_id)
  end
end

