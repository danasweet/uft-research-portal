class ExperimentsController < ApplicationController

  #list of all stubbed experiments associated with a proposal
  def index
    #does rails just know this automatically?
    @proposal = Proposal.find(params[:proposal_id])
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
    @experiment = Experiment.find(params[:id])
  end

  #edit an existing experiment
  def edit
    @experiment = Experiment.find(params[:id])
  end

  #delete an existing experiment
  def destroy
  end

  private

  def experiment_params
    params.require(:experiment).permit(:title, :description, :equipment, :procedure, :observations, :results, :conclusion, :researcher_id, :proposal_id)
  end

end