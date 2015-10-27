class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    redirect_to sessions_new_path unless logged_in?
  end

  # def is_faculty?
  #   redirect_to :back unless @user.role == "faculty"
  # end

  # def is_researcher?

  # end

end
