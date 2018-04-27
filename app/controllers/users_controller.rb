class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create, :show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # @user = current_user if current_user
  end

  def create
  end

end
