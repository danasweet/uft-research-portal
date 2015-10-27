class ExperimentsController < ApplicationController

  #list of all stubbed experiments associated with a proposal
  def index
    @proposal = Proposal.find(params[:proposal_id])
    @comments = @proposal.comments
    @experiments = @proposal.experiments
  end

  #create a new experiment
  def new
    @experiment = Experiment.new
  end

  #create a new experiment
  def create
    #test how to hook up the user correctly?
    # @researcher = User.find(session[:user_id])
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = @proposal.experiments.build(experiment_params)
      if @experiment.save
        redirect_to proposal_experiments_path
      else
        render 'new'
      end
  end

  #display a complete experiment page
  def show
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @experiment = Experiment.find(params[:id])
  end

  #update an existing experiment
  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update(experiment_params)
      redirect_to proposal_experiment_path
    else
      render 'edit'
    end
  end

  #delete an existing experiment
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