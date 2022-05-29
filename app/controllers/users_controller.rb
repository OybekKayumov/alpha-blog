class UsersController < ApplicationController

  def new
    @user = User.new
  end

  # acrion create
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alhha Blog #{@user.username}, you have successfully signed   up "
      redirect_to articles_path
    else 
      render 'new'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end