class VotesController < ApplicationController
  def create 
  	vote = Vote.new(vote_params)
    vote.user = current_user
    vote.save
    redirect_to question_path(vote.question)
  end

  private 

	def vote_params
    params.permit(:question_id, :possible_answer_id)
  end
end