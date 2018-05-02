class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    if params[:email]          #need to redirect if email they entered is not present in database
      # if User.find_by(:email => params[:email])
         @user = User.find_by(:email => params[:email])
       # else
       #   flash[:notice] = "User not found, please try again"
       #   render 'sessions/new'
       # end

    else
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(9)
        end
    end
    @user.save

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
