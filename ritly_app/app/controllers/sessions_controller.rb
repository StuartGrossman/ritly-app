class SessionsController < ApplicationController
  def new
  end

  def create
    signin_params = params.require(:session).permit(:email, :password)
    user = User.find_by_email(signin_params[:email].downcase)

    if user && user.authenticate(signin_params[:password])
      #TODO ->
      #sign_in(user)
      redirect_to(user)
    else
      # create error message and re-render the signin form
      flash[:error] = "Incrrct psswrd & eml cmbo!"
      render :new
    end
  end

  def destroy
    # TODO ->
    # sign_out

    redirect_to(root_url)

  end
end
