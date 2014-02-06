class FacebookController < ApplicationController
  #method to handle the redirect from facebook back to you
  skip_before_filter :verify_authenticity_token, :only => [:canvas]

  def callback
    #get the access token from facebook with your code
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect_to '/facebooks/menu'
  end

  def canvas
    unless current_user
      render :text => "You need to log in. Go to pythiaapp.herokuapp.com and log in!"
      return
  end

    token = current_user.oauth_token
    graph = Koala::Facebook::GraphAPI.new(token)
    request_id = params['request_ids'].split(',').last
    r = graph.get_object(request_id)

    data = JSON.load(r['data'])
    if data && data['question_id']
      redirect_to question_path(data['question_id'])
    else
      render :text => "The data in the request is malformed: #{r}"
    end
  end
#
#   private
#
#   def facebook_params
#     params.require(:question).permit(:body, :text, :question, :possible_answers_attributes => [:id, :body])
#   end
end
  	

