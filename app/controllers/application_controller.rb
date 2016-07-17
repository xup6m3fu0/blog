class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login? ,:current_user # can use login?,current_user method in all html.erb 
 
  def login?
  	!!session[:user_id]
  end	

  def current_user
  	if session[:user_id]!=nil 
  		@current_user=User.find(session[:user_id]).name
  	else 
  		flash[:notice]="Inside Error!! , Please Contact Supervisor!"
  		redirect_to root_path
  	end
  end

end
