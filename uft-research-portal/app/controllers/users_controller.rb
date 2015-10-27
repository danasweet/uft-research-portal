class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to "/posts"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end