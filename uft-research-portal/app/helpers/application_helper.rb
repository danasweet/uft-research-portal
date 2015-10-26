module ApplicationHelper
  def logged_in?
    session[:user_id] ? true : false
  end

  def current_user
    @user || User.find_by(id: session[:user_id]) if logged_in?
  end

end
