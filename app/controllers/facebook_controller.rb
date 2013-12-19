class FacebookController < ApplicationController
  #method to handle the redirect from facebook back to you
  def callback
    #get the access token from facebook with your code
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect_to '/facebooks/menu'
  end

  def canvas
  	
  end
end