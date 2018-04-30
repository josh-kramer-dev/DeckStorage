class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    if @user.id != session[:user_id]
      redirect_to '/'
    end
  end

  def create
  end

end
