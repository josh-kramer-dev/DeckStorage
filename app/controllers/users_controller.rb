class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def show
    @deck = Deck.new
    if !User.find(params[:id])
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end

    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def create

    # raise params.inspect

        @user = User.new
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]

        respond_to do |format|
         if @user.save
          format.html { redirect_to login_path, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
         else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
         end
        end
      end

end
