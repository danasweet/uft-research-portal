class ProposalsController < ApplicationController
  respond_to :html, :js

  before_filter :authorize
  # before_filter :is_faculty?, :except => [:index, :show]

  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.create!(proposal_params)
    @proposal.faculty = User.find_by(id: session[:user_id])
    @proposal.save
      if @proposal.valid?
        redirect_to proposal_path(@proposal)
      else
        redirect_to new_proposal_path
      end
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.update_attributes(proposal_params)
    redirect_to @proposal
  end

  def show
    @proposal = Proposal.find(params[:id])
    @comments = @proposal.comments
    @experiments = @proposal.experiments
    @comment = Comment.new
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
    redirect_to proposals_path
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :summary, :hypothesis, :department, :active)
  end

end

