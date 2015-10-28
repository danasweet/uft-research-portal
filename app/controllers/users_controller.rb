class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && @user.valid?
      redirect_to "/"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    @proposals = @user.proposals
    @experiments = @user.experiments
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end