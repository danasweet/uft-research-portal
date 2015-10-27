class ProposalsController < ApplicationController
  respond_to :html, :js

  def show
    @proposal = Proposal.find(params[:id])
    @comments = @proposal.comments
    @comment = Comment.new
  end
end
