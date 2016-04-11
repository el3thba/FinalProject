class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include UsersHelper
  
  before_action :authorized
  
  protected 
  
  def authorized 
    unless logged_in?
      redirect_to login_path, notice: "Please log in"
    end
  end 
  
end
