class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(user_params[:email], user_params[:password])

    if @user
      redirect_back_or_to root_path, success: "Sign in succeeded!"
    else
      flash.now[:danger] = "Sign in failed!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: "Bye."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
