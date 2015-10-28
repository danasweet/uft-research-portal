class ObservationsController < ApplicationController
  def show
    @observation = Observation.find_by(id: params[:experiment_id])
    @comments = @observation.comments
  end

  def create
  end


end
