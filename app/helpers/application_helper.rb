module ApplicationHelper

  def logged_in?
    session[:user_id] ? true : false
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id]) if logged_in?
  end

  def owns_experiment?
    @experiment = Experiment.find(params[:id])
    session[:user_id] == @experiment.researcher_id ? true : false
  end

  def validate
    render :file => "/public/500.html",  :status => 500 unless owns_experiment?
  end
end