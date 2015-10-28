class ProposalsController < ApplicationController
  respond_to :html, :js

  before_filter :authorize

  def index
    @current_user = User.find_by(id: session[:user_id])
    if params[:search]
      @proposals = Proposal.search(params[:search]).order("created_at DESC")
    else
      @proposals = Proposal.order("created_at DESC")
    end
  end

  def new
    @proposal = Proposal.new
    @current_user = User.find_by(:id => session[:user_id])
    render :file => "/public/500.html", :status => 500 unless @current_user.is_faculty?
  end

  def create
    @proposal = Proposal.create!(proposal_params)
    @proposal.faculty = User.find_by(:id => session[:user_id])
    @proposal.save
      if @proposal.valid?
        redirect_to proposal_path(@proposal)
      else
        render 'new'
      end
  end

  def edit
    @proposal = Proposal.find(params[:id])
    @current_user = User.find_by(:id => session[:user_id])
    render :file => "/public/500.html", :status => 500 unless @current_user.id == @proposal.faculty.id
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update_attributes(proposal_params)
      redirect_to @proposal
    else
      render 'edit'
    end
  end

  def show
    @current_user = User.find_by(:id => session[:user_id])
    @proposal = Proposal.find(params[:id])
    @proposal_creator = @proposal.faculty
    @comments = @proposal.comments
    @experiments = @proposal.experiments
    @researcher_experiments = @experiments.where(researcher_id: @current_user.id)
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

