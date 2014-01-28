class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    new_user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    user = User.new(new_user)

    # if all the validation passed, save the user to the database
    if user.save
      flash[:success] = "Welcome to Ritly!"

      # TODO - implement sign_in method
      sign_in user

      redirect_to user
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update_attributes(params[:user])
  # end
end
