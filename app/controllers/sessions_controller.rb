class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
    @user = User.new
  end

  def create
    if params[:name]
      @user = User.find_by(:name => params[:name])
    else
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(9)
      end
    end

    # if @user.nil? || !@user.valid?      can't get the error messages to work - very frustrating!
    #   render :new
    # else
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    # end
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
