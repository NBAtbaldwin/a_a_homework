class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    # debugger
    if user.nil?
      flash.now[:errors] = ["Invalid login credentials"]
      redirect_to new_sessions_url
    else
      login!(user)
      flash[:notice] = ["Success!"]
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    redirect_to new_sessions_url
  end


end
