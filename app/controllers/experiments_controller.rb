class ExperimentsController < ApplicationController

  before_filter :authorize
  before_filter :validate, :except => [:index, :new, :create]

  #list of all stubbed experiments associated with a proposal
  # def index
  #   @proposal = Proposal.find(params[:proposal_id])
  #   @comments = @proposal.comments
  #   @experiments = @proposal.experiments
  #   render :file => "/public/500.html",  :status => 500 unless session[:user_id] == @proposal.faculty_id
  # end

  def new
    @user = User.find(session[:user_id])
    @experiment = Experiment.new
    render :file => "/public/500.html",  :status => 500 unless @user.is_researcher?
  end

  def create
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = @proposal.experiments.build(experiment_params)
      if @experiment.save
        redirect_to "/proposals/#{@proposal.id}/experiments/#{@experiment.id}"
      else
        render 'new'
      end
  end

  def show
    @user = User.find(session[:user_id])
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.includes(:comments).find(params[:id])
    @equipment_comments = @experiment.comments.equipment
    @procedure_comments = @experiment.comments.procedure
    @observations_comments = @experiment.comments.observations
    @results_comments = @experiment.comments.results
    @conclusion_comments = @experiment.comments.conclusion
    @comment = Comment.new
  end

  def edit
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update(experiment_params)
      redirect_to proposal_experiment_path
    else
      render 'edit'
    end
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy
    redirect_to proposal_experiments_path
  end

  private

  def experiment_params
    params.require(:experiment).permit(:title, :description, :equipment, :procedure, :observations, :results, :conclusion, :researcher_id, :proposal_id)
  end

end
