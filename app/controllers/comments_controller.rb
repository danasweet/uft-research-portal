class CommentsController < ApplicationController
  respond_to :html, :js

  def new
    @comment = Comment.new
  end

  def create
    form_params = params["comment"]
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @observation = Observation.find_by(id: params[:observation_id])
    obs_id = @observation.id if @observation
    @comment = Comment.create(content: form_params[:content], stage: form_params[:stage], commenter_id: session[:user_id], experiment_id: params[:experiment_id], proposal_id: params[:proposal_id], observation_id: obs_id)
    if @comment.valid? && request.xhr?
      if @comment.observation_id
        @observation.comments << @comment
      elsif @comment.experiment_id
        @experiment.comments << @comment
      else
        @proposal.comments << @comment
      end
    end
  end

end
