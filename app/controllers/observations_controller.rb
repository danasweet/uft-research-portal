class ObservationsController < ApplicationController
  def show
    @observation = Observation.find_by(id: params[:experiment_id])
    @comments = @observation.comments
  end

  def create
    p params
    @observation = Observation.create(content: params["observation"]["content"], experiment_id: params[:experiment_id], researcher_id: session[:user_id], proposal_id: params[:proposal_id])
    redirect_to ("/proposals/#{params[:proposal_id]}/experiments/#{params[:experiment_id]}")
  end


end
