class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :current_user
  protect_from_forgery with: :exception

  def index
  end

  def login
  end

  def checkLogin
  	if user = Customer.authenticate(params[:nickname], params[:password])
  		session[:current_user_id] = user.id
  		redirect_to root_url
  	else
  		redirect_to login_path, alert: "Password o Nickname errati"
  	end
  end

  def logout
  	session[:current_user_id] = nil
  	@_current_user = nil
  	redirect_to root_url
  end

  private 

  def current_user
  	@_current_user ||= session[:current_user_id] && Customer.find_by_id(session[:current_user_id])
  end
end
