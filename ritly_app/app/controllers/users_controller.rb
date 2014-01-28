class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    new_user = params.require(:user).permit(:name, :email, :password, :password_confirmation)

    user = User.create(new_user)

    redirect_to user
  end
end
