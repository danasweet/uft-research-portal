class ProposalsController < ApplicationController
  respond_to :html, :js

  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.create!(proposal_params)
    # @proposal.faculty = current_user
    @proposal.faculty = User.find_by(id: session[:user_id])
    @proposal.save
      if @proposal.valid?
        redirect_to proposal_path(@proposal)
      else
        redirect_to new_proposal_path
      end
  end

  def edit
  end

  def update
  end

  def show
    @proposal = Proposal.find(params[:id])
    @comments = @proposal.comments
    @comment = Comment.new
  end

  def destroy
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :summary, :hypothesis, :department, :active)
  end


end

