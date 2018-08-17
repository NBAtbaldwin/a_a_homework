class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:notice] = 'Success!'
      redirect_to bands_url
    else
      flash.now[:errors] = ["Enter a valid username and password"]
      redirect_to new_user_url
    end
  end

  def index

  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
