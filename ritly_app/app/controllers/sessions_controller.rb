class SessionsController < ApplicationController
  def new
  end

  def create
    user_info = params.require(:session).permit(:email, :password)
    user = User.find_by_email(user_info[:email])
    redirect_to user
  end

  def destroy
  end
end
