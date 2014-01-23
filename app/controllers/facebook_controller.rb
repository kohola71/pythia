class FacebookController < ApplicationController
  #method to handle the redirect from facebook back to you
  skip_before_filter :verify_authenticity_token, :only => [:canvas]

  def callback
    #get the access token from facebook with your code
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect_to '/facebooks/menu'
  end

  def canvas
  	@questions = Question.where(user_id: current_user.id)
  	@possible_answers = current_user.possible_answers
  end
end

private

 def facebook_params
    params.require(:question).permit(:body, :text, :question, :possible_answers_attributes => [:id, :body])
  end
end

