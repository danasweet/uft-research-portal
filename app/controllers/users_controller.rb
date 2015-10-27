class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p "*************"
    p user_params
    p "*************"

    if @user.save && @user.valid?
      p "*************"
      p @user.id
      p @user.name
      p "*************"

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
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end