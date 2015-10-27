class CommentsController < ApplicationController
  respond_to :html, :js

  def new
    @comment = Comment.new
  end

  def create
    form_params = params["comment"]
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = @proposal.experiments.find_by(id: params[:experiment_id])
    @comment = Comment.create(content: form_params[:content], stage: params[:stage], commenter_id: session[:user_id], experiment_id: params[:experiment_id], proposal_id: params[:proposal_id])
    if @comment.valid? && request.xhr?
      if @comment.experiment_id
        @experiment.comments << @comment
      else
        @proposal.comments << @comment
      end
    end
  end

end
