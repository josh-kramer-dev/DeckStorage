class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def show
    @deck = Deck.new
    @user = User.find(params[:id])

    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.new
    user.name => params[:name]
    user.email => params[:email]
    user.password => params[:password]
    if user.save
      redirect_to login_path
    else
      redirect_to new_users_path
    end
  end


end
