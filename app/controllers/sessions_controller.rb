class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end

  private

    def login_params
      params.require(:session).permit(:email, :password)
    end

end